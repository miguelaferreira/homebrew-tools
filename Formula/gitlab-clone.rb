class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.28/all-files-v0.1.28.tar.gz"
  sha256 "7265b1b43fca1f59e29a44f431377fc7ed2a4592626787c24586a8f83bf219a0"
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
