cask "sysmon-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "c122f493b075c82343291c6b41c75c84f9288b6629c59f0d3a750467c76161a3",
         intel: "2ea948bbc0bcd950ef7af398f8468b166365ea121b679c056215885a3b232dcb"

  url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.1/Sysmon_#{version}_#{arch}.dmg"
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
