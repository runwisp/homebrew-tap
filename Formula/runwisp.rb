class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.10.0/runwisp-darwin-arm64.tar.gz"
      sha256 "e927c4babfb465a446d02f9436f7d0960efbfd05106bbde625ff3dd4472af591"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.10.0/runwisp-darwin-x64.tar.gz"
      sha256 "c948e52d22544cda24b97d7649bb9749bf0f9903aecdb437959a8e7519f51e25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.10.0/runwisp-linux-arm64.tar.gz"
      sha256 "2c5e3951f458d8ea28e60d41e1d4311af125e4799b1211fb6c6973abcc81f32d"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.10.0/runwisp-linux-x64.tar.gz"
      sha256 "f50ff0037a7bc33ecb7f0ee44fc27d928b1bff84af02d408ad143942788bc971"
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
