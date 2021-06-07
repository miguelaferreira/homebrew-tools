class DevexCli < Formula
  desc "DevEx cli - automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v0.1.0/all-files-v0.1.0.tar.gz"
  sha256 "494da279a2500b49eb3b3c5cecbea70a54f2e3c0ced3c17df9baeaf6c018e2c5"
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
