class Flugenberg < Formula
  desc "Convert EPUB/MOBI/AZW3 books into Kindle-friendly AZW3 and send them over USB"
  homepage "https://github.com/Haugum/homebrew-tap"
  url "https://github.com/Haugum/homebrew-tap/releases/download/v0.3.2/flugenberg-0.3.2-macos-arm64.tar.gz"
  sha256 "029f94e261162eaa68b46ce6d16904269479a3b959cc9f2aee71ef365b82245c"
  version "0.3.2"
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
