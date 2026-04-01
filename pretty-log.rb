class PrettyLog < Formula
  desc "A fast log prettifier for JSON logs with streaming support"
  homepage "https://github.com/r0rr3/pretty-log"
  url "https://github.com/r0rr3/pretty-log/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "f4722108689f5a815b6fc9342204e6d1372d10a9172ca338943797a11bc43b71"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"test.log").write("{\"level\":\"info\",\"msg\":\"test\"}")
    output = shell_output("echo '{\"level\":\"info\",\"msg\":\"hello\"}' | #{bin}/pretty --no-color")
    assert_match /INFO/, output
    assert_match /hello/, output
  end
end
