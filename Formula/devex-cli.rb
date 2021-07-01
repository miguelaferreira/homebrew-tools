class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v0.2.3/all-files-v0.2.3.tar.gz"
  sha256 "f475e06dcb08f2fb479e40a23e8e511cef61219f5ecdd4e772a6bd57fe313574"
  license "MIT-Modern-Variant"

  bottle :unneeded

  def install
    mkdir bin
    on_macos do
      system "shasum", "-c", "devex-macOS-v#{version}.sha256sum"
      cp "devex-macOS-v#{version}", "#{bin}/devex"
    end

    on_linux do
      system "shasum", "-c", "devex-Linux-v#{version}.sha256sum"
      cp "devex-Linux-v#{version}", "#{bin}/devex"
    end
  end

  test do
    system "#{bin}/devex", "--version"
  end
end
