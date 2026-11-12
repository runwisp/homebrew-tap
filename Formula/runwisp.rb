class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.3/runwisp-darwin-arm64.tar.gz"
      sha256 "f2a78f51f7f2122c9eaa563c3518f7a410e41e6730e7964c09506e4e426e6bff"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.3/runwisp-darwin-x64.tar.gz"
      sha256 "fdcb4fd9f20cda4da59832affb2f951fbb19fe5cd7191a0ca9606c5f6c85fc0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.3/runwisp-linux-arm64.tar.gz"
      sha256 "aa31c1709d8150a7f5e83a45f41b3b2e41a6966f528253ed25d8e08f1a001ec7"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.3/runwisp-linux-x64.tar.gz"
      sha256 "5f29e218355e445bada469a7e5a827990bb2c2636b3b32e2dede281d2949cb19"
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
