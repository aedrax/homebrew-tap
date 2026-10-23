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
  end

  name "JSONTitan"
  desc "View and search very large JSON files"
  homepage "https://github.com/aedrax/JSONtitan"

  livecheck do
    url :url
    strategy :github_latest
  end
end
