class Mdv < Formula
  desc "CLI Markdown viewer: browser rendering with live reload, GFM, Mermaid, and PDF/HTML export"
  homepage "https://github.com/Allra-Fintech/mdv"
  url "https://github.com/Allra-Fintech/mdv/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4fc1f118c353a706f3b7613e1ca06643ee38136b7258ddd6feba5759e19547b5"
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
