class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.38/all-files-v0.1.38.tar.gz"
  sha256 "a0800a137d99bc749d677f02d073ace038b71f6521c39dceed3af508d694da89"
  license "MIT-Modern-Variant"

  def install
    mkdir bin

    if OS.mac?
      system "shasum", "-c", "gitlab-clone-macOS-v#{version}.sha256sum"
      cp "gitlab-clone-macOS-v#{version}", "#{bin}/gitlab-clone"
    end

    if OS.linux?
      system "shasum", "-c", "gitlab-clone-Linux-v#{version}.sha256sum"
      cp "gitlab-clone-Linux-v#{version}", "#{bin}/gitlab-clone"
    end
  end

  test do
    system "#{bin}/gitlab-clone", "--version"
  end
end
