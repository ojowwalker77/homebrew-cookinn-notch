cask "cookinn-notch" do
  version "0.0.4"
  sha256 "1d65c6937ef900f765c765de8f9bb2d8f45ec27c096b09c3b6453c17ca97b8aa"

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
