cask "cookinn-notch" do
  version "1.0.0"
  sha256 "REPLACE_WITH_SHA256_FROM_RELEASE"

  url "https://github.com/ojowwalker77/cookinn.notch/releases/download/v#{version}/cookinn.notch-#{version}.zip"
  name "cookinn.notch"
  desc "Beautiful notch companion for Claude Code on macOS"
  homepage "https://github.com/ojowwalker77/cookinn.notch"

  depends_on macos: ">= :sequoia"

  app "cookinn.notch.app"

  postflight do
    # Launch app to trigger setup wizard on first install
    system_command "open", args: ["-g", "#{appdir}/cookinn.notch.app"]
  end

  uninstall quit: "kiwiinit.cookinn-notch"

  zap trash: [
    "~/.config/cookinn-notch",
    "~/Library/Preferences/kiwiinit.cookinn-notch.plist",
  ]
end
