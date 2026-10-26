class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.8.0/runwisp-darwin-arm64.tar.gz"
      sha256 "6844db3ea98ae1859e0fe0917def2f9504940c9b4509d0261e4544df2a0d48ce"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.8.0/runwisp-darwin-x64.tar.gz"
      sha256 "7e5ae874a790918fe827852f3d8f1eef99e48cc9ab332a85be30885319be0394"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.8.0/runwisp-linux-arm64.tar.gz"
      sha256 "82d8039755102a63646388a73fd524e1716316498d921aecd84ef0df26d07714"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.8.0/runwisp-linux-x64.tar.gz"
      sha256 "e60f8544ea38df4851c31d821a3afd55d39f3d7d6bec778742e25e2f35674dbd"
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
