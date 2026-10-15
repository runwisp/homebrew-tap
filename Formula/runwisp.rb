class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.0/runwisp-darwin-arm64.tar.gz"
      sha256 "0eb1a6e95f411616ae31cf93c97544a25a5dcd25bef7c0817f013673a6e0b098"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.0/runwisp-darwin-x64.tar.gz"
      sha256 "798971a68ba05b9a6f804b9b2f637d8a8e25a0faf39f515ae4fb47bcf3d31cc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.0/runwisp-linux-arm64.tar.gz"
      sha256 "8206efa982cf6512105bdb53d999dc131a350395decb5a8210258e58403e1d7e"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.0/runwisp-linux-x64.tar.gz"
      sha256 "de40a34d75bf43606de6f596b364bbe866c040c086680f21085d8c0e89e633eb"
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
