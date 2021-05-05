# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GitlabClone < Formula
  desc "Tool to clone complete GitLab groups"
  homepage "https://github.com/miguelaferreira/gitlab-clone"
  url "https://github.com/miguelaferreira/gitlab-clone/releases/download/v0.1.11/gitlab-clone-macOS"
  version "v0.1.11"
  sha256 "9833ca9ccd8f9597a5e73fe7c58670c7b276192a5e55153eed3c7a34acccdd97"
  license "The Unlicense"

  bottle :unneeded

  def install
    system "mkdir", bin
    system "cp", "gitlab-clone-macOS", "#{bin}/gitlab-clone"
  end

  test do
    system "#{bin}/julia", "--version"
  end
end
