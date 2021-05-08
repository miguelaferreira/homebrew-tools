class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.27/all-files-v0.1.27.tar.gz"
  sha256 "d18d6251851e49aee26c3794abf39fbcd45c56a2f9b2050523a7f969991ce57d"
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
