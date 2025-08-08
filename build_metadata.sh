#!/bin/bash -v

. .venv/bin/activate

set -ex

runtime='org.freedesktop.Sdk//24.08'

if ! test -e "flatpak-cargo-generator.py"; then
  wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/refs/heads/master/cargo/flatpak-cargo-generator.py -O flatpak-cargo-generator.py
fi

uv run python flatpak-cargo-generator.py --yaml -o uv_rust.yaml Cargo.lock
cat uv_rust.yaml | {
echo "
name: uv
buildsystem: simple
build-options:
  append-path: /usr/lib/sdk/rust-stable/bin
  build-args:
    - --share=network
build-commands:
  - /bin/ls
  - cargo build --release --locked --manifest-path flatpak-cargo/git/uv-aec90f0/Cargo.toml
  - install -Dm755 flatpak-cargo/git/uv-aec90f0/target/release/uv /app/uv
sources:
"; cat
} > uv_rust.yaml.tmp && mv -v uv_rust.yaml{.tmp,}