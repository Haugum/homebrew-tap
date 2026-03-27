class Flugenberg < Formula
  desc "Convert EPUB/MOBI/AZW3 books into Kindle-friendly AZW3 and send them over USB"
  homepage "https://github.com/Haugum/homebrew-tap"
  url "https://github.com/Haugum/homebrew-tap/releases/download/v0.3.3/flugenberg-0.3.3-macos-arm64.tar.gz"
  sha256 "b77bee1734e8f197816c893a3fc00bb423146af12afc3eb3b7e690826b5dcf65"
  version "0.3.3"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "flugenberg"
    (pkgshare/"renderer").install Dir["renderer/*"]

    (bin/"flugenberg").write_env_script libexec/"flugenberg",
      "FLUGENBERG_ASSETS_DIR" => pkgshare/"renderer"
  end

  def caveats
    <<~EOS
      Flugenberg also needs Calibre at runtime.

        brew install --cask calibre

      Then run:

        flugenberg init
        flugenberg doctor
    EOS
  end

  test do
    output = shell_output("#{bin}/flugenberg --help")
    assert_match "AZW3", output
  end
end
