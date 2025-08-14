# instructions

```bash
flatpak --user install org.freedesktop.Sdk/24.08
flatpak --user install org.freedesktop.Sdk.Extension.rust-stable
flatpak --user install com.riverbankcomputing.PyQt.BaseApp/6.9
./build_metadata.sh # generates uv.lock, Cargo.lock, uv_rust.yaml
./build_flatpak.sh
flatpak run --user si.biolab.orange
```
