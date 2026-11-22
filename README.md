# Homebrew Tap (`zvision755/tap`)

Personal Homebrew Tap for macOS Casks not yet eligible for `Homebrew/homebrew-cask`.

## Included Casks

- `mister-download-manager` — [Mister Download Manager](https://misterdownloadmanager.com/) (open-source multi-connection download manager, macOS experimental build).

## Usage

```bash
brew tap zvision755/tap
brew trust --tap zvision755/tap
brew install --cask zvision755/tap/mister-download-manager
```

### Upgrade & Uninstall

```bash
brew upgrade --cask zvision755/tap/mister-download-manager
brew uninstall --cask zvision755/tap/mister-download-manager
```

*(Note: `brew uninstall --cask` preserves user settings and download history in `~/Library/Application Support/misterdownloadmanager`. Pass `--zap` only if you want to remove all user data.)*

## Automated Updates

`.github/workflows/update-mdm.yml` checks `anefzaoui/misterdownloadmanager` GitHub Releases daily, verifies `SHA256SUMS.txt` for both `arm64` and `x86_64` DMGs, and commits updates to `Casks/mister-download-manager.rb` automatically once this repository is pushed to GitHub.
