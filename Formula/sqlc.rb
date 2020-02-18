class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/tarball/fe82f35ecdcb117269a86909f69672bd32548a73"
  sha256 "ffc62973da6b6bd00db9f9577c366897162ea5c0efa63c85770bf313b2d080eb"
  head "https://github.com/kyleconroy/sqlc.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    (buildpath/"src/github.com/kyleconroy/sqlc").install buildpath.children

    cd "src/github.com/kyleconroy/sqlc" do
      system "go", "build", "-o", bin/"sqlc", "-ldflags=\"-X 'github.com/kyleconroy/sqlc/internal/cmd.version=v1.0.0'\"", "./cmd/sqlc"
    end
  end
end
