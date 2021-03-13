class Cloudelephant < Formula
  desc "Find idle and unsed resources in your public cloud (AWS, Azure)"
  homepage "https://github.com/aint/CloudElephant"
  url "https://github.com/aint/CloudElephant/archive/v0.2.0.tar.gz"
  sha256 "ea5288cbc8da73196cac20ef34bb4a0304d48abf4b91ad2a189be1f9a7a6f566"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"ce", "-ldflags", "-X github.com/aint/CloudElephant/cmd.gitTag=#{version} -X github.com/aint/CloudElephant/cmd.gitBranch=master"
  end

  test do
    assert_equal "Cloud Elephant #{version} darwin/amd64", shell_output("#{bin}/ce -v").strip
  end
end
