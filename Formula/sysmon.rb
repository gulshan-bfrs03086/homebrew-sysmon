class Sysmon < Formula
  desc "Real-time system monitor for the terminal, in the spirit of htop"
  homepage "https://github.com/gulshan-bfrs03086/sysmon"
  url "https://github.com/gulshan-bfrs03086/sysmon/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "d0178fec375846275a31679b2132a2f8be4167950d48c28977fb9a2e0c2305e4"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/sysmon-tui")
    # cargo install names the binary after the crate; users run it as "sysmon".
    bin.install_symlink bin/"sysmon-tui" => "sysmon"
  end

  test do
    assert_match "sysmon #{version}", shell_output("#{bin}/sysmon --version")
    assert_match "USAGE", shell_output("#{bin}/sysmon --help")
    # A tty is required to render, so an unknown flag is the deepest the binary
    # can be exercised without one.
    assert_match "unrecognised option", shell_output("#{bin}/sysmon --nope 2>&1", 2)
  end
end
