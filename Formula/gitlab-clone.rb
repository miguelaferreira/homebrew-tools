class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.18/all-files-v0.1.18.tar.gz"
  sha256 "4785fd9399c4ccf0693e69f621faf77ff4d40a954f5b8ceba4504c53aef67c3a"
  license "MIT-Modern-Variant"

  bottle :unneeded

  def install
    mkdir bin
    on_macos do
      system "shasum", "-c", "gitlab-clone-macOS-v#{version}.sha256sum"
      cp "gitlab-clone-macOS-v#{version}", "#{bin}/gitlab-clone"
    end

    on_linux do
      system "shasum", "-c", "gitlab-clone-Linux-v#{version}.sha256sum"
      cp "gitlab-clone-Linux-v#{version}", "#{bin}/gitlab-clone"
    end
  end

  test do
    system "#{bin}/gitlab-clone", "--version"
  end
end
