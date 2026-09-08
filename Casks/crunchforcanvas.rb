cask "crunchforcanvas" do
  version "0.1.2"
  sha256 "0f0afeea823b382029fb01b1f0037e8ab1a143a81e872ad02b92bff9315dbefb"

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

  # Crunch is ad-hoc signed rather than notarized, because notarizing needs a
  # paid Apple Developer membership. This cask shipped without the step below,
  # on the belief that macOS would merely ask the student to approve the first
  # launch. It does not. Measured on macOS 26.6 against a build the machine had
  # never approved: launching the quarantined app DELETES the bundle out of
  # /Applications within seconds, and it is not in the Trash afterwards. The
  # same build with the flag cleared launches and stays. So the choice was never
  # "clear the flag or make the student approve it", it was "clear the flag or
  # ship something that erases itself", and the caveat below says plainly that
  # this happened. `postflight_steps`, not `postflight`: the latter is
  # deprecated and warns on every install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-d", "-r", "com.apple.quarantine", "{{appdir}}/Crunch.app"]
  end

  caveats <<~EOS
    Crunch for Canvas is ad-hoc signed and not notarized by Apple, so this cask
    cleared the quarantine flag on the installed app for you. Without that,
    macOS deletes the app the first time you open it. That is a security check
    being cleared on your behalf, so it is worth knowing what you are trusting:
    the app connects only to the Canvas host you configure, keeps your token in
    a file only you can read, and has no analytics or updater. Release security
    details are at https://github.com/MalekAlbdoor/CrunchForCanvas-releases
  EOS

  zap trash: "~/Library/Application Support/Crunch"
end
