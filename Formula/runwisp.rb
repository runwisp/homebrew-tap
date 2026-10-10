class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.6.0/runwisp-darwin-arm64.tar.gz"
      sha256 "59a656f003b03b6a5a0496f1095de066cf0915c6b351406340bb2f1cbc04c260"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.6.0/runwisp-darwin-x64.tar.gz"
      sha256 "750a7cc6453d5c908b217a49c2c5432281f80a883663044e62067bba5db15b7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.6.0/runwisp-linux-arm64.tar.gz"
      sha256 "8256f705a179b5fc74099bef4f079b01527bd19a5cf6132f8e5215df1774af13"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.6.0/runwisp-linux-x64.tar.gz"
      sha256 "d30056dbc64267a0170f155dc48c6dd863e87d1afa6318da009b2700e648b55f"
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
