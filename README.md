# Homebrew Tap for Zzz CLI

Install the [Zzz](https://github.com/seemsindie/zzz_cli) CLI tool via Homebrew.

## Installation

```bash
brew tap seemsindie/zzz
brew install zzz
```

## Upgrade

```bash
brew update
brew upgrade zzz
```

## Updating the Formula

After a new release, run the helper script to compute SHA256 hashes:

```bash
./update-formula.sh v0.2.0
```

Then update `Formula/zzz.rb` with the printed hashes and the new version number.
