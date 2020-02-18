class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v1.0.0.tar.gz"
  sha256 "40443ef8b63f57d731d4cff21134bc6a07ab949e3f3a489a5cffd4c5808e3932"
  head "https://github.com/kyleconroy/sqlc.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    (buildpath/"src/github.com/kyleconroy/sqlc").install buildpath.children

    cd "src/github.com/kyleconroy/sqlc" do
      system "go", "build", "-ldflags", "-X github.com/kyleconroy/sqlc/internal/cmd.version=v1.0.0", "-o", bin/"sqlc", "./cmd/sqlc"
    end
  end
end
