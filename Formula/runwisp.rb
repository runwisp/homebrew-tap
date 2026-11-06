class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.1/runwisp-darwin-arm64.tar.gz"
      sha256 "2861f3e0b299d70b15166a3a92f849b41a132ae53b845bc3fcdad0d2985b42b5"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.1/runwisp-darwin-x64.tar.gz"
      sha256 "04aa37f4147520e541725fc81ff34e89aa768bd230d5e5aad86c62362d897284"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.1/runwisp-linux-arm64.tar.gz"
      sha256 "3713c873c4f55534b75332723fd2ad46a4871e7d60bfcc7c9bf20c1c52a49c0f"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.1/runwisp-linux-x64.tar.gz"
      sha256 "0a1998e47bfe2e1a5d831627d471babf8126845d0ca469e81861e557eb00f629"
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
