class Flugenberg < Formula
  desc "Convert EPUB/MOBI/AZW3 books into Kindle-friendly AZW3 and send them over USB"
  homepage "https://github.com/Haugum/homebrew-tap"
  url "https://github.com/Haugum/homebrew-tap/releases/download/v0.3.1/flugenberg-0.3.1-macos-arm64.tar.gz"
  sha256 "6e58afd59ec9ce6aec938098afcb3a251ac172a522c85a9a65bd8ff7a12eac60"
  version "0.3.1"
  license "MIT"

  depends_on "calibre"
  depends_on "node"

  def install
    libexec.install "flugenberg-#{version}-macos-arm64/flugenberg"
    (pkgshare/"renderer").install Dir["flugenberg-#{version}-macos-arm64/renderer/*"]

    (bin/"flugenberg").write_env_script libexec/"flugenberg",
      "FLUGENBERG_ASSETS_DIR" => pkgshare/"renderer"
  end

  test do
    output = shell_output("#{bin}/flugenberg --help")
    assert_match "AZW3", output
  end
end
