cask "crunchforcanvas" do
  version "0.1.1"
  sha256 "0f68df96be9d0bbb67ea531b0d09f1f9fa3adafa9399f77afc38116f9b2e384b"

  # The url stanza takes no extra parameter. Homebrew deprecated the one that
  # restated the host, and a GitHub release URL is checked by its default
  # behaviour anyway. Left in, it printed a deprecation warning four times
  # during one ordinary install, so a test refuses it.
  url "https://github.com/MalekAlbdoor/CrunchForCanvas-releases/releases/download/mac-v#{version}/CrunchForCanvas-#{version}.zip"
  name "Crunch for Canvas"
  desc "Menu bar coursework dashboard and desktop widgets for Canvas"
  homepage "https://github.com/MalekAlbdoor/CrunchForCanvas-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  app "Crunch.app"

  caveats <<~EOS
    Crunch for Canvas is ad-hoc signed and not notarized by Apple. macOS may
    require you to explicitly approve its first launch. The app only connects
    to the Canvas host you configure; release security details are at
    https://github.com/MalekAlbdoor/CrunchForCanvas-releases
  EOS

  zap trash: "~/Library/Application Support/Crunch"
end
