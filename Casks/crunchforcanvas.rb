cask "crunchforcanvas" do
  version "0.1.0"
  sha256 "e028f3cb92fa5fb3b48020d44f7fb31eb763cbea00150f0b1b830119f9b3e845"

  url "https://github.com/MalekAlbdoor/CrunchForCanvas-releases/releases/download/mac-v#{version}/CrunchForCanvas-#{version}.zip",
      verified: "github.com/MalekAlbdoor/CrunchForCanvas-releases/"
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
