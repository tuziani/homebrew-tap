cask "vibe-corgi" do
  version "0.1.3,19"
  sha256 "43ca12ff95b96ca43e55870cd02876b428c7aa6c99f36b7a6c1839c5e77a8922"

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
