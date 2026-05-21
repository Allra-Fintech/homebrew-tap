class Mdv < Formula
  desc "CLI Markdown viewer: browser rendering with live reload, GFM, Mermaid, and PDF export"
  homepage "https://github.com/Allra-Fintech/mdv"
  url "https://github.com/Allra-Fintech/mdv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b55a06f1a37ced27dc08875e76d39ac48ca40f54c95501b5f17d2a1f23b52280"
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
