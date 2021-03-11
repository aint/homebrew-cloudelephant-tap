class Cloudelephant < Formula
  desc "Find idle and unsed resources in your public cloud (AWS, Azure)"
  homepage "https://github.com/aint/CloudElephant"
  url "https://github.com/aint/CloudElephant/archive/v0.2.0.tar.gz"
  sha256 "ea5288cbc8da73196cac20ef34bb4a0304d48abf4b91ad2a189be1f9a7a6f566"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"ce", "-ldflags", "-X github.com/aint/CloudElephant/cmd.gitTag=#{version}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test CloudElephant`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_equal "Cloud Elephant #{version} darwin/amd64", shell_output("#{bin}/ce -v").strip
  end
end
