class Mattermoist < Formula
  desc "Mattermost TUI client"
  homepage "https://github.com/aedrax/mattermoist"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do
      url "https://github.com/aedrax/mattermoist/releases/download/v#{version}/mattermoist-v#{version}-darwin-x64.tar.gz"
      sha256 "2ac58f7d4654a78a789a4bc346f83e2ff4804c2c19d7178b995b63bf5ff53868"
    end

    on_arm do
      url "https://github.com/aedrax/mattermoist/releases/download/v#{version}/mattermoist-v#{version}-darwin-arm64.tar.gz"
      sha256 "6a5bd0bcb342a299b55fedfcf88f2d33b01ebb2cfcf38540de32ec53b8b0ea3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aedrax/mattermoist/releases/download/v#{version}/mattermoist-v#{version}-linux-x64.tar.gz"
      sha256 "908aa93d327a4c7cf4b11deb15016b0d90f223a576eb57af2d99ce2aae113013"
    end

    on_arm do
      url "https://github.com/aedrax/mattermoist/releases/download/v#{version}/mattermoist-v#{version}-linux-arm64.tar.gz"
      sha256 "23144fc09ebc8ea6a3b63e395b9955af213eec5f7c98f7e542c1fc3affcea385"
    end
  end

  def install
    bin.install Dir["mattermoist-*"].first => "mattermoist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mattermoist --version")
  end
end
