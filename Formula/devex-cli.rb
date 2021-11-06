class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/archive/v1.2.4.tar.gz"
  sha256 "10692f6799e23e3915cf0f9f2a1cdd7ce0b78819c23a5a8b0a705587a5943fa3"
  license "MIT-Modern-Variant"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "openjdk"

  conflicts_with "miguelaferreira/tools/devex-cli-native-binary", because: "it also ships a devex executable"

  def install
    system "./gradlew", "assemble", "-x", "test"

    mkdir_p libexec/"bin"
    mkdir_p libexec/"lib"
    mv "build/libs/devex-#{version}-all.jar", libexec/"lib"

    bin.write_jar_script libexec/"lib/devex-#{version}-all.jar", "devex"

    ohai "🤓 Check the toolkit docs 📘 out at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  end

  test do
    assert_match version, shell_output("#{bin}/devex -V").strip
  end
end
