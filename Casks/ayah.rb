cask "ayah" do
  version "1.0.0"
  sha256 "354faf3669731b975fad43e650ada916035b1969e74704535b9ff166b4affd1f"

  url "https://github.com/MalekAlbdoor/ayah/releases/download/v#{version}/Ayah-#{version}.zip",
      verified: "github.com/MalekAlbdoor/ayah/"
  name "Ayah"
  desc "Quran verse on your desktop, refreshed on your schedule"
  homepage "https://github.com/MalekAlbdoor/ayah"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Ayah.app"

  # Ayah is ad-hoc signed rather than notarized, because notarizing requires a
  # paid Apple Developer membership and the app is free. macOS would otherwise
  # refuse to open it, and Homebrew 6 removed --no-quarantine with no
  # replacement, so clear the flag here instead. The caveats below tell the
  # user this happened; see the homepage for what the app can and cannot do.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Ayah.app"]
  end

  caveats <<~EOS
    Ayah is open source and not notarized by Apple, so this cask cleared the
    quarantine flag on #{appdir}/Ayah.app for you. It is sandboxed and has no
    network entitlement, so it cannot reach the network at all. Read the source
    or build it yourself at https://github.com/MalekAlbdoor/ayah

    To add the widget: right-click the desktop, choose Edit Widgets, search for
    Ayah, and drag "Verse of the Day" where you want it.
  EOS

  zap trash: [
    "~/Library/Containers/com.malek.ayah",
    "~/Library/Containers/com.malek.ayah.widget",
  ]
end
