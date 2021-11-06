class DevexCli < Formula
  desc "Automating development gruntwork"
  homepage "https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  url "https://github.com/miguelaferreira/devex-cli/archive/v1.2.3.tar.gz"
  sha256 "bdb8b87c99dbfab1eff5d5c2f1885df77124b405ec083a70c5f038cc7249284e"
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
    mv "build/homebrew-formula/devex", libexec/"bin/devex"
    mv "build/libs/devex-#{version}-all.jar", libexec/"lib"

    bin.write_jar_script libexec/"lib/devex-#{version}-all.jar", "devex"

    ohai "🤓 Check the toolkit docs 📘 out at https://miguelaferreira.gitbook.io/devex/devex-cli/overview"
  end

  test do
    assert_match version, shell_output("#{bin}/devex -V").strip
  end
end
