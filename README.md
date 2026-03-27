# Homebrew Tap for Pidgn CLI

Install the [Pidgn](https://github.com/seemsindie/pidgn_cli) CLI tool via Homebrew.

## Installation

```bash
brew tap seemsindie/pidgn
brew install pidgn
```

## Upgrade

```bash
brew update
brew upgrade pidgn
```

## Updating the Formula

After a new release, run the helper script to compute SHA256 hashes:

```bash
./update-formula.sh v0.2.0
```

Then update `Formula/pidgn.rb` with the printed hashes and the new version number.
