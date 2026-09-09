class Texio < Formula
  desc "Reliable structural Markdown operations for shell scripts and AI agents"
  homepage "https://github.com/Allra-Fintech/texio"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Allra-Fintech/texio/releases/download/v0.1.1/texio-aarch64-apple-darwin.tar.gz"
      sha256 "d0ae96e87794b1bbee823b5b3d01b181bcdd81e47ea36da5f1da21b6bcb5608c"
    end
    on_intel do
      url "https://github.com/Allra-Fintech/texio/releases/download/v0.1.1/texio-x86_64-apple-darwin.tar.gz"
      sha256 "847c3f724f1d6c6bb01ee319c883e61ff557f3fe40d1f1ea77b4608149b9e559"
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
