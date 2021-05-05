class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.12/all-files.tar.gz"
  version "0.1.12"
  sha256 "2cd2de18dcc151f055bae220f5a304cba6110cf77184c2b5d6e6277b6d1ebef6"
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
