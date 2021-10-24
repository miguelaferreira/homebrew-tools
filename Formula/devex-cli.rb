class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.2.0/all-files-v1.2.0.tar.gz"
  sha256 "7ecef580d36d4bc2af8edd5d9a14f8d5ffee915f9cdf8ed2dd040fecf0f7633a"
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
