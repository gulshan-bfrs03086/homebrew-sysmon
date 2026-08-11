class Sysmon < Formula
  desc "Real-time system monitor for the terminal, in the spirit of htop"
  homepage "https://github.com/gulshan-bfrs03086/sysmon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.2/sysmon-tui-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "7c6b7317eb0236cc748ed349290efac06b74290583d4d3d2788823f7f6ba5b40"
    end
    on_intel do
      url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.2/sysmon-tui-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "0dd8c5278774f58c7c1a9b93bce8308a87931d5a6e507be97982fa646c9654bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/gulshan-bfrs03086/sysmon/releases/download/v0.2.2/sysmon-tui-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "242cc0d61c6f6abdb3662d056a67df0756c6afeabe6a8d88c880f17e8aa2f9d0"
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
