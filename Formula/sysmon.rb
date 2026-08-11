class Sysmon < Formula
  desc "Real-time system monitor for the terminal, in the spirit of htop"
  homepage "https://github.com/gulshan-bfrs03086/sysmon"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.1/sysmon-tui-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "da6e678a9d1f373bb8922ebc8b39343272e82aab9a77d008d96cbd57eb0cd385"
    end
    on_intel do
      url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.1/sysmon-tui-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "b96d3fa5390fbcb8b5d73c994fe7017461deb56190d970296d20d18557788c12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.1/sysmon-tui-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f26a87ca5caaecfab266ef03ec654e130c46395bf984e3f6bf647a60168bea33"
    end
  end

  def install
    bin.install "sysmon-tui" => "sysmon"
  end

  test do
    assert_match "sysmon #{version}", shell_output("#{bin}/sysmon --version")
    assert_match "USAGE", shell_output("#{bin}/sysmon --help")
    # A tty is required to render, so an unknown flag is the deepest the binary
    # can be exercised without one.
    assert_match "unrecognised option", shell_output("#{bin}/sysmon --nope 2>&1", 2)
  end
end
