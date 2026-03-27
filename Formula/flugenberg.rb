class Flugenberg < Formula
  desc "Convert EPUB/MOBI/AZW3 books into Kindle-friendly AZW3 and send them over USB"
  homepage "https://github.com/Haugum/flugenberg"
  url "https://github.com/Haugum/flugenberg/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5c1aa7fe4e95199529320046ed05e42a852f85ea8652280da75e86b85bb80c61"
  license "MIT"

  depends_on "rust" => :build
  depends_on "calibre"
  depends_on "node"

  def install
    system "cargo", "install", *std_cargo_args(prefix: libexec)

    (pkgshare/"renderer").install "assets/renderer/render_screens.mjs"
    (pkgshare/"renderer").install "assets/renderer/package.json"
    (pkgshare/"renderer").install "assets/renderer/package-lock.json"
    system "npm", "install", "--omit=dev", chdir: pkgshare/"renderer"

    (bin/"flugenberg").write_env_script libexec/"bin/flugenberg",
      "FLUGENBERG_ASSETS_DIR" => pkgshare/"renderer"
  end

  test do
    output = shell_output("#{bin}/flugenberg --help")
    assert_match "Build Kindle-friendly AZW3 files", output
  end
end
