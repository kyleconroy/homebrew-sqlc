class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  # TODO: Use a tagged release for v1.1.0
  url "https://github.com/kyleconroy/sqlc/tarball/d8c0915ca5a51d715dba604cb3a32026b12283d1"
  sha256 "0ccddf2a9a56b78d4f0ebfcfb99fd1ccb80a4e45fc5ba8115e4a3b603d7ea6d6"
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
