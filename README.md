# disclaimer

this is unofficial flatpak

* https://github.com/biolab/orange3-installers/issues/53
* https://github.com/biolab/orange3/issues/5403

# instructions

```bash
flatpak --user install org.freedesktop.Sdk/24.08
flatpak --user install org.freedesktop.Sdk.Extension.rust-stable
flatpak --user install com.riverbankcomputing.PyQt.BaseApp/6.9
./build_metadata.sh # generates uv.lock, Cargo.lock, uv_rust.yaml
./build_flatpak.sh
flatpak run --user si.biolab.orange # actual orange installation happens here
```
