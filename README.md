# dotfiles

Personal dotfiles for macOS and Linux. Config files live at the repo root and are symlinked into `~/`.

## Requirements

- zsh + [oh-my-zsh](https://ohmyz.sh/)
- git
- most
- [buku](https://github.com/jarun/buku) — bookmark manager
- [jrnl](https://jrnl.sh/) — journal CLI
- **macOS:** Homebrew (Apple Silicon or Intel)
- **Linux:** phpenv (optional)

## Files

| File | Description |
|------|-------------|
| `zshrc` | Shell config — OS-aware (macOS/Linux), PATH, aliases |
| `gitconfig` | Git config with aliases (`lol`, `grab`, `repush`, `trunk`) |
| `gitignore_global` | Global gitignore |
| `composer.json` | Global PHP dev tools (phpcs, psysh, phpmd, php-cs-fixer) |
| `ackrc` | ack search config |
| `jslintrc` | JSLint config |
| `bookmarks.db` | buku bookmark database |
| `journal.txt` | jrnl journal file |

## Installation

```bash
git clone <repo-url> ~/.dotfiles

# Create symlinks manually
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
```

## Secrets

Credentials and tokens go in `~/.zshrc.secrets` (never committed). This file is sourced automatically if it exists.

## Adding New Config

Place the config file at the repo root and add a symlink manually.
