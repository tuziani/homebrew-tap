cask "vibe-corgi" do
  version "0.1.0"
  sha256 "87cd4c62fadf7cb1a1286e7c3e0cdb1df898047138a236f7a650411180bd56ba"

  url "https://vibecorgi.conylab.workers.dev/download/VibeCorgi.zip"
  name "Vibe Corgi"
  desc "Menubar desktop pet that mirrors Claude Code's live state"
  homepage "https://vibecorgi.conylab.workers.dev/"

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
