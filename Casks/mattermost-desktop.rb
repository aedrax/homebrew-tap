cask "mattermost-desktop" do
  version "6.3.2"
  sha256 arm:          "16bdf2b9d7a17224b399f30a957db4046b3c00a9b01e6ade3507ef5c0b5a37d6",
         intel:        "557f6194100c2da1d0c5f8a34dd73dcfd69fc35edf2f88361935ae65d6d9b2c7",
         arm64_linux:  "cd34b52b729b34fb2f63df92b555db5c1bee03118b81bbdda1ff1aa3c3c77d7c",
         x86_64_linux: "acb445ae07e3dd45fd3cf90fd8036e1574180457d7e0c6c26711f45808721d8a"

  on_macos do
    arch arm: "arm64", intel: "x64"

    url "https://releases.mattermost.com/desktop/#{version}/mattermost-desktop-#{version}-mac-#{arch}.dmg"

    depends_on macos: :monterey

    app "Mattermost.app"
    binary "#{appdir}/Mattermost.app/Contents/MacOS/Mattermost", target: "mattermost-desktop"

    uninstall quit: "Mattermost.Desktop"
  end
  on_linux do
    arch arm: "arm64", intel: "x86_64"

    url "https://releases.mattermost.com/desktop/#{version}/mattermost-desktop-#{version}-linux-#{arch}.AppImage"

    app_image "mattermost-desktop-#{version}-linux-#{arch}.AppImage", target: "Mattermost.AppImage"
    binary "#{Dir.home}/Applications/Mattermost.AppImage", target: "mattermost-desktop"

    postflight_steps do
      mkdir_p ".local/share/applications", base: :home
      mkdir_p ".local/share/icons/hicolor/256x256/apps", base: :home
      run "Applications/Mattermost.AppImage",
          base:           :home,
          args:           ["--appimage-extract", "usr/share/icons/hicolor/256x256/apps/mattermost-desktop.png"],
          chdir:          "{{temp}}",
          writable_paths: "{{temp}}"
      copy "{{temp}}/squashfs-root/usr/share/icons/hicolor/256x256/apps/mattermost-desktop.png",
           ".local/share/icons/hicolor/256x256/apps/mattermost-desktop.png",
           target_base: :home
      write_file ".local/share/applications/mattermost-desktop.desktop", <<~EOS, base: :home
        [Desktop Entry]
        Type=Application
        Name=Mattermost
        Comment=Desktop client for Mattermost team messaging
        Exec={{HOMEBREW_PREFIX}}/bin/mattermost-desktop %U
        Icon=mattermost-desktop
        Categories=Network;InstantMessaging;
        MimeType=x-scheme-handler/mattermost;
        Terminal=false
        StartupWMClass=Mattermost
      EOS
    end

    uninstall_postflight_steps do
      remove [
        ".local/share/applications/mattermost-desktop.desktop",
        ".local/share/icons/hicolor/256x256/apps/mattermost-desktop.png",
      ], base: :home
    end
  end

  name "Mattermost"
  desc "Desktop client for Mattermost team messaging"
  homepage "https://github.com/mattermost/desktop"

  livecheck do
    url :homepage
    strategy :github_latest
  end
end
