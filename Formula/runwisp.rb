class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.1/runwisp-darwin-arm64.tar.gz"
      sha256 "3bce49c4f5210fad7e41922692062a0b78f8392721fad10e7240423bd99ea092"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.1/runwisp-darwin-x64.tar.gz"
      sha256 "d989223821bcaa6320d041057370b0cef771f36d497393c621f6fd23a5260543"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.1/runwisp-linux-arm64.tar.gz"
      sha256 "cee8f81113531b0d1d60c2ef931c3cfc65baa3d496188126890da6935172d6a8"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.7.1/runwisp-linux-x64.tar.gz"
      sha256 "9e67ed58c8dfca5b247b45ef3791455d8c67c2442a8a583a07ca1c76d182336a"
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
