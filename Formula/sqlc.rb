class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v0.1.0.tar.gz"
  sha256 "5c693e24579e42478d08ed693785054cf97d8ae362b324e923029f54b1313fa5"
  head "https://github.com/kyleconroy/sqlc.git"

  depends_on "go" => :build

  bottle do
    root_url "https://homebrew.bintray.com/bottles-sqlc"
    cellar :any_skip_relocation
    sha256 "57f8ce52e3872630ae62c2a065afd900b211c5a35cd8a2fcc9c13a5b0d2d8bf0" => :mojave
  end

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    (buildpath/"src/github.com/kyleconroy/sqlc").install buildpath.children

    cd "src/github.com/kyleconroy/sqlc" do
      system "go", "build", "-o", bin/"sqlc", "./cmd/sqlc"
    end
  end
end
