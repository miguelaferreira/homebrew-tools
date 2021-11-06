class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/archive/refs/tags/v1.2.5.tar.gz"
  sha256 "5a703c0aa3ceb3c3ad8c67b5c7ee0b162feb297b34a2c536718910d0f3a4a72c"
  license "MIT-Modern-Variant"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "openjdk@17"

  conflicts_with "miguelaferreira/tools/devex-cli-native-binary", because: "it also ships a devex executable"

  def install
    system "./gradlew", "assemble", "-x", "test"

    mkdir_p libexec/"bin"
    mkdir_p libexec/"lib"
    mv "build/libs/devex-#{version}-all.jar", libexec/"lib"

    bin.write_jar_script libexec/"lib/devex-#{version}-all.jar", "devex"

    ohai "🤓 Check the toolkit docs 📘 out at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
    ohai "⚠️ devex requires Java 17 to execute"
    ohai "Please make sure an older version of Java isn't configured via JAVA_HOME ⚠️"
  end

  test do
    assert_match version, shell_output("#{bin}/devex -V").strip
  end
end
