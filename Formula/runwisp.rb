class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.11.0/runwisp-darwin-arm64.tar.gz"
      sha256 "db50b8b2399b73d349153e0c8e6bae59dd9362b6632e95b0771653e136fbc480"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.11.0/runwisp-darwin-x64.tar.gz"
      sha256 "519cee89ff362df4dd3b0658b5087aa7804db7aab56d333a452fb6196a9af67f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.11.0/runwisp-linux-arm64.tar.gz"
      sha256 "7b1bf5cd7713f8535cc5928cb176ba059d4dc69a643b46bd3c48bb01e6045277"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.11.0/runwisp-linux-x64.tar.gz"
      sha256 "3acf99a4592d2a66ffde0c295be8190e5ca40ce485d76a20fb12d47229327b95"
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
