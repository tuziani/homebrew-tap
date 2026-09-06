# homebrew-tap

Homebrew tap for conylab apps.

```sh
brew tap tuziani/tap
brew install --cask vibe-corgi
```

## Casks

| Cask | App | What it is |
| --- | --- | --- |
| `vibe-corgi` | Vibe Corgi | A menubar desktop pet that mirrors Claude Code's live state — it runs while the agent works, naps when it idles, and poops when a session is waiting on you. |

Vibe Corgi is signed with a Developer ID and notarized by Apple, so it opens without a Gatekeeper
prompt. `brew uninstall --cask vibe-corgi` removes the app; add `--zap` to also remove
`~/Library/Application Support/RunCorgi` and its preferences. The app's own "Disconnect" menu item
is what removes its hooks from `~/.claude/settings.json` — the cask never touches that file.
