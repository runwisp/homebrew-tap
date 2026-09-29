class Runwisp < Formula
  desc "Cron and process supervisor with run history, logs, web UI and TUI"
  homepage "https://runwisp.com"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.2.0/runwisp-darwin-arm64.tar.gz"
      sha256 "9c240dec9d2e080322dd06614f58c544cbde07f0a0596edb97baa3083dc2ef26"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.2.0/runwisp-darwin-x64.tar.gz"
      sha256 "9408ed880cf2c515fbce7f3dca7cf0d32fbecf1d6b25338d864147e85c8ab9ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runwisp/runwisp/releases/download/v1.2.0/runwisp-linux-arm64.tar.gz"
      sha256 "97c9a1a459444a87f358aa38db5da777019697661a67d73d856caec6079c8e44"
    else
      url "https://github.com/runwisp/runwisp/releases/download/v1.2.0/runwisp-linux-x64.tar.gz"
      sha256 "a6ef20bdf9b43c25c2a4ed8528dedc4478d51d24aa0cb3d39c6b4c9a561e3fe0"
    end
  end

  def install
    bin.install "runwisp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/runwisp --version")
  end
end
