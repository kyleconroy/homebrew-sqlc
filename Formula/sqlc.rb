class Sqlc < Formula
  desc "Generate type safe Go from SQL"
  homepage "https://sqlc.dev/"
  url "https://github.com/kyleconroy/sqlc/archive/v1.4.0.tar.gz"
  sha256 "77a09f42cc88e59e6788579628c8606760851f72488133595522825695baf892"
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
