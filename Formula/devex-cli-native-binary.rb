class DevexCliNativeBinary < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.2.0/all-files-v1.2.0.tar.gz"
  sha256 "7ecef580d36d4bc2af8edd5d9a14f8d5ffee915f9cdf8ed2dd040fecf0f7633a"
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
