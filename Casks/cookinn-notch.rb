cask "cookinn-notch" do
  version "1.5"
  sha256 "a19f4dbcb2025f004d7dc69d4aee11c8a9b7b856d205b7103e7b4ef9d2a4b308"

  url "https://github.com/ojowwalker77/cookinn.notch/releases/download/v#{version}/cookinn.notch-#{version}.zip"
  name "cookinn.notch"
  desc "Beautiful notch companion for Claude Code on macOS"
  homepage "https://github.com/ojowwalker77/cookinn.notch"

  depends_on macos: ">= :sequoia"

  app "cookinn.notch.app"

  postflight do
    # Remove quarantine attribute (app is not notarized)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/cookinn.notch.app"],
                   sudo: false
  end

  caveats <<~EOS
    cookinn.notch is not notarized. If macOS blocks it, run:
      xattr -cr /Applications/cookinn.notch.app
  EOS

  uninstall quit: "kiwiinit.cookinn-notch"

  zap trash: [
    "~/.config/cookinn-notch",
    "~/Library/Preferences/kiwiinit.cookinn-notch.plist",
  ]
end
