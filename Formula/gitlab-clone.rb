class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.35/all-files-v0.1.35.tar.gz"
  sha256 "ae0e18c24c960b7381d31c7d7422d9b08c09addbd42a0dab5d89944082f86b34"
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
