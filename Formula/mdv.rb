class Mdv < Formula
  desc "CLI Markdown viewer: browser rendering with live reload, GFM, Mermaid, and PDF/HTML export"
  homepage "https://github.com/Allra-Fintech/mdv"
  url "https://github.com/Allra-Fintech/mdv/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9283d6f9757dd47d462b700d4721aa60a4e0736f46862f9a6f20a749a3bce704"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/mdv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdv --version")
  end
end
