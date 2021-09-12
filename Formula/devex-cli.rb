class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.0.0/all-files-v1.0.0.tar.gz"
  sha256 "c9cb100102870d05ddad6a27d06907d1c04bdd881570ee85523cf4086ce1c3da"
  license "MIT-Modern-Variant"
  head "https://github.com/miguelaferreira/devex-cli.git", branch: "main"

  bottle :unneeded

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
