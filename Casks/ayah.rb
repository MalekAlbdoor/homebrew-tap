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

  # Ayah is not notarized, so Homebrew's quarantine would block it from
  # opening. Install with:
  #   brew install --no-quarantine malekalbdoor/tap/ayah
  depends_on macos: ">= :tahoe"

  app "Ayah.app"

  zap trash: [
    "~/Library/Containers/com.malek.ayah",
    "~/Library/Containers/com.malek.ayah.widget",
  ]
end
