class DevexCliJdk < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/archive/refs/tags/v1.2.12.tar.gz"
  sha256 "01ba8152e6bc96e7d99b2fa2981087c23de93e6684dec42c8b261ee8eb99bbd4"
  license "MIT-Modern-Variant"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "openjdk@25"

  conflicts_with "miguelaferreira/tools/devex-cli", because: "it also ships a devex executable"

  def install
    system "./gradlew", "assemble", "-x", "test"

    mkdir_p libexec/"bin"
    mkdir_p libexec/"lib"
    mv "build/libs/devex-#{version}-all.jar", libexec/"lib"

    bin.write_jar_script libexec/"lib/devex-#{version}-all.jar", "devex"

    ohai "🤓 Check the toolkit docs 📘 out at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
    ohai "⚠️ devex requires Java 25 to execute"
    ohai "Please make sure an older version of Java isn't configured via JAVA_HOME ⚠️"
  end

  test do
    assert_match version, shell_output("#{bin}/devex -V").strip
  end
end
