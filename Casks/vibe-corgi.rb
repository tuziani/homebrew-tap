cask "vibe-corgi" do
  version "0.1.2,18"
  sha256 "a62fdbe40bcc69a37fbaffc449a2993869e75d2464ed6b39503b26bc2c9b6eee"

  url "https://vibecorgi.net/download/VibeCorgi.dmg"
  name "Vibe Corgi"
  desc "Menubar desktop pet that mirrors Claude Code's live state"
  homepage "https://vibecorgi.net/"

  # The download URL carries no version — every release overwrites the same path — so there is
  # nothing for livecheck to compare against. Bump `version` and `sha256` by hand on each release.
  livecheck do
    skip "No versioned download URL"
  end

  depends_on macos: :ventura

  app "Vibe Corgi.app"

  uninstall quit: "com.cony.corgirun"

  # The corgi's own support folder and preferences only. Claude Code's ~/.claude is the user's,
  # never ours to delete — "Disconnect" inside the app restores its settings.json instead.
  zap trash: [
    "~/Library/Application Support/RunCorgi",
    "~/Library/Preferences/com.cony.corgirun.plist",
  ]
end
