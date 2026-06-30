class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/releases/download/v1.2.10/all-files-v1.2.10.tar.gz"
  sha256 "36a743aac0d46b10b49f93d614c878e00cdda90194f6da434e6aab576dd705a1"
  license "MIT-Modern-Variant"
  head "https://github.com/miguelaferreira/devex-cli.git", branch: "main"

  conflicts_with "miguelaferreira/tools/devex-cli-jdk", because: "devex-cli-jdk also ships a devex executable"

  def install
    is_os_supported = OS.mac? || OS.linux?
    raise "Unsupported OS" unless is_os_supported

    os = OS.mac? ? "macOS" : "Linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"

    # No native binary is built for macOS on Intel (amd64): the release matrix
    # ships Linux amd64, Linux arm64, and macOS arm64 only. Fail early with a
    # clear message instead of a confusing missing-file error from shasum.
    if OS.mac? && arch == "amd64"
      odie <<~EOS
        devex-cli does not ship a native binary for macOS on Intel (amd64).
        Supported native targets are macOS arm64, Linux amd64, and Linux arm64.
        On an Intel Mac, install the JVM formula instead:
          brew install miguelaferreira/tools/devex-cli-jdk
      EOS
    end

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
