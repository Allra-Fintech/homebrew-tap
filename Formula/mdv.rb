class Mdv < Formula
  desc "CLI Markdown viewer: browser rendering with live reload, GFM, Mermaid, and PDF/HTML export"
  homepage "https://github.com/Allra-Fintech/mdv"
  url "https://github.com/Allra-Fintech/mdv/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "27d745996c4dc74eb3c175e0882a1e710672d3d4861e1526a8a9384404f048f3"
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
