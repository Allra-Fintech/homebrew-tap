class Texio < Formula
  desc "Reliable structural Markdown operations for shell scripts and AI agents"
  homepage "https://github.com/Allra-Fintech/texio"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Allra-Fintech/texio/releases/download/v0.1.3/texio-aarch64-apple-darwin.tar.gz"
      sha256 "5c8f330eb883698cc1651e4995020f796b6f8192bbb775d24416a05713025595"
    end
    on_intel do
      url "https://github.com/Allra-Fintech/texio/releases/download/v0.1.3/texio-x86_64-apple-darwin.tar.gz"
      sha256 "e89e001a83d9b6ea325e218351563ea57634ed576ddadb0d26effb0cd0b2a190"
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
