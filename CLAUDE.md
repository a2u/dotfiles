# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository. Tracks shell configuration and syncs it to GitHub.

## Sync Workflow

The `sync.sh` script is the primary tool: it copies tracked dotfiles from `$HOME` into this repo, commits, and pushes.

```bash
./sync.sh
```

To track a new dotfile, add its name to the `DOTFILES` array in `sync.sh`, then run the script.

## Files

- `.zshrc` — Zsh config (autosuggestions via Homebrew, starship prompt, aliases, history dedup)
- `.motd` — ASCII art displayed on shell startup via `cat ~/.motd` in `.zshrc`
- `sync.sh` — One-way sync: `$HOME` → repo → GitHub. Does not deploy files back to `$HOME`.

## Notes

- Sync is one-directional. There is no install/bootstrap script to symlink or copy files *into* `$HOME`.
- `.zshrc` depends on Homebrew packages: `zsh-autosuggestions`, `starship`.
