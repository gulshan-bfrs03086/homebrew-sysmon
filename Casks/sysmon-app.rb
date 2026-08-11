cask "sysmon-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "8b261ebd61911b71f2ef7d43ddcd24dc1dd6751b779296b51f67e70d1bc17f4d",
         intel: "27db0da99c169c0e13f2dbb1f31648801e5b525791a8009625b9727f998023ee"

  url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.3/Sysmon_#{version}_#{arch}.dmg"
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
