class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v1.6.0.tar.gz"
  sha256 "a95a123f29a71f5a2eea0811e4590d59cbc92eccd407abe93c110c738fc4740b"
  head "https://github.com/kyleconroy/sqlc.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", bin/"sqlc", "./cmd/sqlc"
  end
end
