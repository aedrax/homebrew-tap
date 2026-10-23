cask "logdor" do
  version "1.0.0"
  sha256 arm:          "d5da0142a8bf07346ac8911fb0f979b5dba4e9eee539cac75d35b9762bf5b0b6",
         intel:        "d5da0142a8bf07346ac8911fb0f979b5dba4e9eee539cac75d35b9762bf5b0b6",
         x86_64_linux: "78c464fa7012efcf9048213af00461633d78117b24fd6ad7d62320bd7879d90e"

  on_macos do
    url "https://github.com/aedrax/logdor/releases/download/v#{version}/Logdor-macos-universal-webengine.dmg"

    app "logdor.app"
    binary "#{appdir}/logdor.app/Contents/MacOS/logdor"
  end
  on_linux do
    url "https://github.com/aedrax/logdor/releases/download/v#{version}/Logdor-linux-x86_64-webengine.AppImage"

    app_image "Logdor-linux-x86_64-webengine.AppImage", target: "Logdor.AppImage"
    binary "~/Applications/Logdor.AppImage", target: "logdor"
  end

  name "Logdor"
  desc "Log viewer with WebEngine map viewer support"
  homepage "https://github.com/aedrax/logdor"

  livecheck do
    url :url
    strategy :github_latest
  end
end
