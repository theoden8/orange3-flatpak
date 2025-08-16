#!/usr/bin/env bash

set -ex

flatpak install --user -y flathub org.flatpak.Builder
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
./build_metadata.sh
flatpak run --user --command=flathub-build org.flatpak.Builder --install ./si.biolab.orange.yaml
flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest si.biolab.orange.yaml
