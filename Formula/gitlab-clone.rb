class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.13/all-files.tar.gz"
  sha256 "13338b09bb1127d36082a1f421534418eb0a7e5388762f4f64da7fd47c960f22"
  license "MIT-Modern-Variant"

  bottle :unneeded

  def install
    mkdir bin
    on_macos do
      system "shasum", "-c", "gitlab-clone-macOS.sha256sum"
      cp "gitlab-clone-macOS", "#{bin}/gitlab-clone"
    end

    on_linux do
      system "shasum", "-c", "gitlab-clone-Linux.sha256sum"
      cp "gitlab-clone-Linux", "#{bin}/gitlab-clone"
    end
  end

  test do
    system "#{bin}/gitlab-clone", "--version"
  end
end
