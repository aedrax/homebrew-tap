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
    binary "#{Dir.home}/Applications/Logdor.AppImage", target: "logdor"

    postflight_steps do
      mkdir_p ".local/share/applications", base: :home
      mkdir_p ".local/share/icons/hicolor/256x256/apps", base: :home
      run "Applications/Logdor.AppImage",
          base:           :home,
          args:           ["--appimage-extract", "usr/share/icons/hicolor/256x256/apps/logdor.png"],
          chdir:          "{{temp}}",
          writable_paths: "{{temp}}"
      copy "{{temp}}/squashfs-root/usr/share/icons/hicolor/256x256/apps/logdor.png",
           ".local/share/icons/hicolor/256x256/apps/logdor.png",
           target_base: :home
      write_file ".local/share/applications/logdor.desktop", <<~EOS, base: :home
        [Desktop Entry]
        Type=Application
        Name=Logdor
        Comment=Log file viewer with pluggable format parsers
        Exec={{HOMEBREW_PREFIX}}/bin/logdor %F
        Icon=logdor
        Categories=Development;Utility;
        Terminal=false
      EOS
    end

    uninstall_postflight_steps do
      remove [
        ".local/share/applications/logdor.desktop",
        ".local/share/icons/hicolor/256x256/apps/logdor.png",
      ], base: :home
    end
  end

  name "Logdor"
  desc "Log viewer with WebEngine map viewer support"
  homepage "https://github.com/aedrax/logdor"

  livecheck do
    url :url
    strategy :github_latest
  end
end
