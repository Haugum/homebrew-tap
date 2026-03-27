# Haugum Homebrew Tap

This tap publishes Flügenberg for Homebrew.

Architecture:
- source repo: `Haugum/flugenberg` (private)
- tap repo: `Haugum/homebrew-tap` (public)
- public release artifacts are attached to releases in this tap repo
- the formula installs from those public prebuilt tarballs

## Install

```bash
brew install Haugum/homebrew-tap/flugenberg
brew install --cask calibre
```

## Upgrade

```bash
brew update
brew upgrade flugenberg
brew upgrade --cask calibre
```

## Uninstall

```bash
brew uninstall flugenberg
brew untap Haugum/homebrew-tap
```

## Notes

- Rust is not required on end-user machines.
- Flügenberg currently requires `node` at runtime for renderer checks.
- Calibre is a real runtime dependency and is installed separately as a cask.
- The formula fetches only public prebuilt release artifacts, never private source.
