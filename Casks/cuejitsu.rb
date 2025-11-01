cask "cuejitsu" do
  version "0.0.1"
  sha256 :no_check # Will be updated with actual SHA256 after first release

  url "https://github.com/zenibako/cuejitsu/releases/download/v#{version}/Cuejitsu-#{version}.dmg",
      headers: { "Authorization" => "token #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN")}" }
  name "Cuejitsu"
  desc "Menu bar app for controlling QLab from screenwriting software"
  homepage "https://github.com/zenibako/cuejitsu"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Cuejitsu.app"

  # No quarantine since app is unsigned
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Cuejitsu.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.zenibako.cuejitsu.plist",
    "~/Library/Saved Application State/com.zenibako.cuejitsu.savedState",
  ]
end
