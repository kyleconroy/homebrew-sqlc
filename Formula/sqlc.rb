class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v1.5.0.tar.gz"
  sha256 "9000a71974c0327e6fda5f46421bb6d58b102164046d271c6f174dd5f437e99e"
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
