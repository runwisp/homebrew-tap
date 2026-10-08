class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.5.1/runwisp-darwin-arm64.tar.gz"
      sha256 "c966ee1baf9c625aa3ef50370252b297da968ad2be6b0a3934fe30d4b06b3825"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.5.1/runwisp-darwin-x64.tar.gz"
      sha256 "1983cbcad5d8928e771f880eb2a23478e6583495afda7eea08e1b4862302933b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.5.1/runwisp-linux-arm64.tar.gz"
      sha256 "004ff8e6be037c82ed79e4526fc15038cc21c2f27f9c93a85b8a866cbe5313e5"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.5.1/runwisp-linux-x64.tar.gz"
      sha256 "176d42f125e4a59c2bd7f3d969515eee96b1f7d7a5d7def8c10f7bda649fa502"
    end
  end

  def install
    bin.install "runwisp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/runwisp --version")
  end
end
