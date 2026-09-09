class Texio < Formula
  desc "Reliable structural Markdown operations for shell scripts and AI agents"
  homepage "https://github.com/Allra-Fintech/texio"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Allra-Fintech/texio/releases/download/v0.1.2/texio-aarch64-apple-darwin.tar.gz"
      sha256 "0c7ad5722f5d4d14658a9bc44f17c851ddcf7f24f06f172d6b7fcad8317979b2"
    end
    on_intel do
      url "https://github.com/Allra-Fintech/texio/releases/download/v0.1.2/texio-x86_64-apple-darwin.tar.gz"
      sha256 "20433557c85076c9d43de5abaab59fb7f20c714256493e7e5cc9c56fb79772bc"
    end
  end

  depends_on :macos

  def install
    bin.install "texio"
  end

  test do
    assert_match "texio #{version}", shell_output("#{bin}/texio --version")
    (testpath/"sample.md").write("# Demo\n\n## Target\nold\n\n## Keep\nunchanged\n")
    original = (testpath/"sample.md").read
    system bin/"texio", "replace", "sample.md", "--section", "Target", "--text", "new", "--dry-run"
    assert_equal original, (testpath/"sample.md").read
    system bin/"texio", "replace", "sample.md", "--section", "Target", "--text", "new", "--write"
    assert_equal "# Demo\n\n## Target\nnew\n## Keep\nunchanged\n", (testpath/"sample.md").read
  end
end
