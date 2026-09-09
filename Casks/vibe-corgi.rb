cask "vibe-corgi" do
  version "0.1.0,13"
  sha256 "1ed4ec22fbacd3e1d9e57d9aaa63e171b24f5a6e3749799a158afadc0b7d4eb9"

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
