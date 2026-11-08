class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.2/runwisp-darwin-arm64.tar.gz"
      sha256 "e82e9dff155f7796b6b37b726a3054ed271a217ba2432a5eaa2cc6655cced770"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.2/runwisp-darwin-x64.tar.gz"
      sha256 "bf63c6967a3496ddc598450fdb5ecc71808ad44e16d76bdf71e7874bf4fb2327"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.2/runwisp-linux-arm64.tar.gz"
      sha256 "f898299953e5548e99f5fbd5444b85fe40113aca4c9b1b26b0c05cec8c08becf"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.9.2/runwisp-linux-x64.tar.gz"
      sha256 "fc291411d836d539d4c3e94212c87d3f87f786117b07dce073a7c45a6d142775"
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
