#!/bin/bash -v

. .venv/bin/activate

set -ex

runtime='org.freedesktop.Sdk//24.08'

if ! test -e "flatpak-cargo-generator.py"; then
  wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/cargo/flatpak-cargo-generator.py -O flatpak-cargo-generator.py
fi

uv lock
cargo generate-lockfile
uv run python flatpak-cargo-generator.py --yaml -t -o uv_rust.yaml Cargo.lock
