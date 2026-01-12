cask "cookinn-notch" do
  version "1.7"
  sha256 "95de565a5aeb176dbeda454fdcb95238a3afdbb1a77cbc835f881137aed37813"

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
