class DevexCliNativeBinary < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.2.6/all-files-v1.2.6.tar.gz"
  sha256 "82fb5a0f5b0e9d300a3d094c04a8e4f777ccf21a6fe70e97b15f4abc6587cf3d"
  license "MIT-Modern-Variant"
  head "https://github.com/miguelaferreira/devex-cli.git", branch: "main"

  conflicts_with "miguelaferreira/tools/devex-cli", because: "devex-cli also ships a devex executable"

  def install
    is_os_supported = OS.mac? || OS.linux?
    raise "Unsupported OS" unless is_os_supported

    os = OS.mac? ? "macOS" : "Linux"
    binary = "devex-#{os}-v#{version}"
    system "shasum", "-c", "#{binary}.sha256sum"
    mv binary, "devex"
    bin.install "devex"

    ohai "🤓 Read the documentation on devex-cli gitbook 📘 at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  end

  test do
    assert_match version, shell_output("#{bin}/devex -V").strip
  end
end
