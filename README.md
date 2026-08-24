# malekalbdoor/tap

Homebrew tap for my macOS apps.

## Ayah

A Quran verse on your Mac desktop, refreshed on your schedule. [Source and documentation](https://github.com/MalekAlbdoor/ayah).

```sh
brew install --cask malekalbdoor/tap/ayah
```

Then right-click your desktop, choose **Edit Widgets**, search for **Ayah**, and drag **Verse of the Day** where you want it.

### What the cask does about quarantine

Ayah is not notarized by Apple, since notarizing requires a paid Apple Developer membership and the app is free. macOS quarantines anything downloaded and refuses to open un-notarized quarantined apps, so the cask clears that flag in a `postflight` block during install, and prints a note saying it did.

That is a security check being cleared on your behalf, so it is worth knowing what you are trusting. Ayah is sandboxed, has no network entitlement, and is built from source you can read. The [security notes](https://github.com/MalekAlbdoor/ayah#what-you-are-trusting) go through it in full, and building from source skips the flag entirely.
