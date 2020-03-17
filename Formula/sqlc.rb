class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v1.1.0.tar.gz"
  sha256 "6b361b9467ae176a670c52007cd876c2b1787fc3d0870852964c9bdcfe5c68ea"
  head "https://github.com/kyleconroy/sqlc.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    (buildpath/"src/github.com/kyleconroy/sqlc").install buildpath.children

    cd "src/github.com/kyleconroy/sqlc" do
      system "go", "build", "-o", bin/"sqlc", "./cmd/sqlc"
    end
  end
end
