# malekalbdoor/tap

Homebrew tap for my macOS apps.

## Ayah

A Quran verse on your Mac desktop, refreshed on your schedule. [Source and documentation](https://github.com/MalekAlbdoor/ayah).

```sh
brew install --no-quarantine malekalbdoor/tap/ayah
open /Applications/Ayah.app
```

### Why `--no-quarantine`

Ayah is not notarized by Apple, since notarizing requires a paid Apple Developer membership and the app is free. Without the flag, macOS quarantines the download and refuses to open it.

The app is open source, sandboxed, and has no network entitlement, so it cannot reach the network at all. See the [security notes](https://github.com/MalekAlbdoor/ayah#why---no-quarantine) for what you are actually trusting, or build it from source to skip the flag entirely.
