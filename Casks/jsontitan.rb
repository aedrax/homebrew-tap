cask "jsontitan" do
  version "1.0.0"
  sha256 arm:          "4ae622739b07619ee36a7eca5ddeebda5b2e23457a65bb5fda72aed3ececae68",
         intel:        "4ae622739b07619ee36a7eca5ddeebda5b2e23457a65bb5fda72aed3ececae68",
         x86_64_linux: "389f91c68750864a2ce5c2f5992887d564aaf0a0d8a64d588c43731da5e8f410"

  on_macos do
    url "https://github.com/aedrax/JSONtitan/releases/download/v#{version}/JSONTitan-macos-universal.dmg"

    app "JSONTitan.app"
    binary "#{appdir}/JSONTitan.app/Contents/MacOS/JSONTitan", target: "jsontitan"
  end
  on_linux do
    url "https://github.com/aedrax/JSONtitan/releases/download/v#{version}/JSONTitan-linux-x86_64.AppImage"

    app_image "JSONTitan-linux-x86_64.AppImage", target: "JSONTitan.AppImage"
    binary "#{Dir.home}/Applications/JSONTitan.AppImage", target: "jsontitan"

    postflight_steps do
      mkdir_p ".local/share/applications", base: :home
      mkdir_p ".local/share/icons/hicolor/256x256/apps", base: :home
      run "Applications/JSONTitan.AppImage",
          base:           :home,
          args:           ["--appimage-extract", "usr/share/icons/hicolor/256x256/apps/jsontitan.png"],
          chdir:          "{{temp}}",
          writable_paths: "{{temp}}"
      copy "{{temp}}/squashfs-root/usr/share/icons/hicolor/256x256/apps/jsontitan.png",
           ".local/share/icons/hicolor/256x256/apps/jsontitan.png",
           target_base: :home
      write_file ".local/share/applications/jsontitan.desktop", <<~EOS, base: :home
        [Desktop Entry]
        Type=Application
        Name=JSONTitan
        Comment=Fast JSON viewer and editor
        Exec={{HOMEBREW_PREFIX}}/bin/jsontitan %f
        Icon=jsontitan
        Categories=Development;Utility;
        MimeType=application/json;
        Terminal=false
      EOS
    end

    uninstall_postflight_steps do
      remove [
        ".local/share/applications/jsontitan.desktop",
        ".local/share/icons/hicolor/256x256/apps/jsontitan.png",
      ], base: :home
    end
  end

  name "JSONTitan"
  desc "View and search very large JSON files"
  homepage "https://github.com/aedrax/JSONtitan"

  livecheck do
    url :url
    strategy :github_latest
  end
end
