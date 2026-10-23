class KiroCli < Formula
  desc "Agentic AI CLI assistant (formerly Amazon Q Developer CLI)"
  homepage "https://kiro.dev"
  version "2.33.1"

  livecheck do
    url "https://prod.download.cli.kiro.dev/stable/latest/manifest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  on_macos do
    url "https://prod.download.cli.kiro.dev/stable/#{version}/Kiro%20CLI.dmg"
    sha256 "f544b4f9de51a457e1ed0849ffdf2be7b6b70af491330006b01cb71fa2111f44"
  end

  on_linux do
    on_intel do
      url "https://prod.download.cli.kiro.dev/stable/#{version}/kirocli-x86_64-linux.tar.xz"
      sha256 "e798062c22adb3be53ea1845f9b309b83df017376860f8329293f3c2954177cb"
    end

    on_arm do
      url "https://prod.download.cli.kiro.dev/stable/#{version}/kirocli-aarch64-linux.tar.xz"
      sha256 "00ddb7a1be28130ba197c8d8990d8345bb1d6b8166d5d59a7405cf21407c18d2"
    end
  end

  def install
    if OS.mac?
      app_root = Pathname("Kiro CLI.app").exist? ? Pathname("Kiro CLI.app") : buildpath
      libexec.install app_root/"Contents"
      bin.install_symlink Dir["#{libexec}/Contents/MacOS/kiro-cli*"]
    else
      bin.install "bin/kiro-cli"
      bin.install "bin/kiro-cli-chat"
      bin.install "bin/kiro-cli-term"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiro-cli --version")
  end
end
