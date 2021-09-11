class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v0.2.4/all-files-v0.2.4.tar.gz"
  sha256 "34c6bb3da5660899ed085f74e9206ee49af6e9cbf09c95298a066d2f4b35cef7"
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

    ohai "🤓 Read the documentations on devex-cli gitbook 📘 at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  end

  test do
    system "#{bin}/devex", "--version"
  end
end
