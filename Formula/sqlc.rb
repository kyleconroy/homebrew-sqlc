class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v1.3.0.tar.gz"
  sha256 "3c8f08fabe9f5bf06666a7d20466ca6562f770bb9bc92d18e496e6ad04891a66"
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
