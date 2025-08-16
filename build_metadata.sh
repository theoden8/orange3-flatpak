#!/bin/bash -v

. .venv/bin/activate

set -ex

runtime='org.freedesktop.Sdk//24.08'

if ! test -e "flatpak-cargo-generator.py"; then
  wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/cargo/flatpak-cargo-generator.py -O flatpak-cargo-generator.py
fi

uv lock
if ! test -v "uv"; then
  (git clone https://github.com/astral-sh/uv uv-git && cd uv-git && git checkout 0.8.11)
fi
uv run python flatpak-cargo-generator.py --yaml -o uv.yaml uv-git/Cargo.lock
