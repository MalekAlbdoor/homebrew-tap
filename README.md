# malekalbdoor/tap

Homebrew tap for my macOS apps.

## Ayah

A Quran verse on your Mac desktop, refreshed on your schedule. [Source and documentation](https://github.com/MalekAlbdoor/ayah).

```sh
brew install malekalbdoor/tap/ayah
xattr -r -d com.apple.quarantine /Applications/Ayah.app
open /Applications/Ayah.app
```

### Why the `xattr` line is needed

Ayah is not notarized by Apple, since notarizing requires a paid Apple Developer membership and the app is free. macOS quarantines anything downloaded and refuses to open un-notarized quarantined apps, so the flag has to be cleared once after installing.

Homebrew used to offer `--no-quarantine` for this, but [removed it in Homebrew 6 with no replacement](https://github.com/Homebrew/brew/issues/20755).

The app is open source, sandboxed, and has no network entitlement, so it cannot reach the network at all. See the [security notes](https://github.com/MalekAlbdoor/ayah#why---no-quarantine) for what you are actually trusting, or build it from source to skip the flag entirely.
