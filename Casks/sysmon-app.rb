cask "sysmon-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "2bc83c7b8d96303191cdcdbbc71a4e79c69f7b3f7d01dfc30f18d62e3b7a15f1",
         intel: "9b232a281717386c818f741ebd7488153286d335da72871219f79e52b85dd05e"

  url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.2/Sysmon_#{version}_#{arch}.dmg"
  name "Sysmon"
  desc "Real-time system monitor with charts, a process table and kill protection"
  homepage "https://github.com/gulshan-bfrs03086/sysmon"

  depends_on macos: :big_sur

  app "Sysmon.app"

  caveats <<~CAVEATS
    Sysmon is not code-signed yet, so macOS will refuse to open it until the
    quarantine flag is cleared:

      xattr -cr "/Applications/Sysmon.app"

    The terminal build is unsigned too, but Homebrew only quarantines casks,
    so it installs and runs with no extra step:

      brew install gulshan-bfrs03086/sysmon/sysmon
  CAVEATS

  zap trash: [
    "~/Library/Application Support/com.gulshan.sysmon",
    "~/Library/Saved Application State/com.gulshan.sysmon.savedState",
    "~/.config/sysmon",
  ]
end
