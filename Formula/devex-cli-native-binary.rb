class DevexCliNativeBinary < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.2.5/all-files-v1.2.5.tar.gz"
  sha256 "2a6369ed11fbe9b8faeba42df92a8d5403c343c11fdeed6078d48bb0022825ec"
  license "MIT-Modern-Variant"
  head "https://github.com/miguelaferreira/devex-cli.git", branch: "main"

  conflicts_with "miguelaferreira/tools/devex-cli", because: "devex-cli also ships a devex executable"

  def install
    is_os_supported = OS.mac? || OS.linux?
    raise "Unsupported OS" unless is_os_supported

    os = OS.mac? ? "macOS" : "Linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    binary = "devex-#{os}-#{arch}-v#{version}"
    system "shasum", "-c", "#{binary}.sha256sum"
    mv binary, "devex"
    bin.install "devex"

    ohai "🤓 Read the documentation on devex-cli gitbook 📘 at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  end

  test do
    assert_match version, shell_output("#{bin}/devex -V").strip
  end
end
