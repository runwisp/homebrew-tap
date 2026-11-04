class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.0/runwisp-darwin-arm64.tar.gz"
      sha256 "8e0731dda6d6aac286be8c259acfcff00d9f069d2e8489c858ea0ff30e83dd6c"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.0/runwisp-darwin-x64.tar.gz"
      sha256 "f7d27828618706a5daeb1b56e56af381f04e8911329ae7525df8e7f8fc4c346a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.0/runwisp-linux-arm64.tar.gz"
      sha256 "21a38f07c82415633369db61e0fa26acc81634a9ec8ed620755655226d60cb9d"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.0/runwisp-linux-x64.tar.gz"
      sha256 "6317db7f0e2b4d5604b9a04b3f106272c20efc39d02a0a102c737793546e72d3"
    end
  end

  # The binary sits in libexec beside a .runwisp-source marker, which the
  # update check reads as its install source. bin only gets a symlink, so the
  # dotfile never lands in the shared <prefix>/bin.
  def install
    libexec.install "runwisp"
    (libexec/".runwisp-source").write "homebrew\n"
    bin.install_symlink libexec/"runwisp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/runwisp --version")
  end
end
