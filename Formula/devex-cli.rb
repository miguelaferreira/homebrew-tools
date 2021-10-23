class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.1.0/all-files-v1.1.0.tar.gz"
  sha256 "75e922bd70d35329a7ff83b15e9a0a0b7aae4fe47c03fd2bd12577e2f2cd4bd5"
  license "MIT-Modern-Variant"
  head "https://github.com/miguelaferreira/devex-cli.git", branch: "main"

  def install
    mkdir bin

    if OS.mac?
      system "shasum", "-c", "devex-macOS-v#{version}.sha256sum"
      cp "devex-macOS-v#{version}", "#{bin}/devex"
    end

    if OS.linux?
      system "shasum", "-c", "devex-Linux-v#{version}.sha256sum"
      cp "devex-Linux-v#{version}", "#{bin}/devex"
    end

    ohai "🤓 Read the documentation on devex-cli gitbook 📘 at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  end

  test do
    system "#{bin}/devex", "--version"
  end
end
