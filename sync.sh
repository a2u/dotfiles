#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="$HOME"

# List of dotfiles to track (add more as needed)
DOTFILES=(
  .zshrc
)

# List of dotfile directories to track
DOTFILE_DIRS=(
  .config/neofetch
  .config/ghostty
)

echo "==> Copying dotfiles to repo..."
for f in "${DOTFILES[@]}"; do
  src="$HOME_DIR/$f"
  if [ -f "$src" ]; then
    cp "$src" "$DOTFILES_DIR/$f"
    echo "  Copied $f"
  else
    echo "  WARNING: $src not found, skipping"
  fi
done

for d in "${DOTFILE_DIRS[@]}"; do
  src="$HOME_DIR/$d"
  if [ -d "$src" ]; then
    mkdir -p "$DOTFILES_DIR/$d"
    cp -r "$src/." "$DOTFILES_DIR/$d/"
    echo "  Copied $d/"
  else
    echo "  WARNING: $src not found, skipping"
  fi
done

cd "$DOTFILES_DIR"

if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "==> No changes to commit."
  exit 0
fi

git add -A
git commit -m "Update dotfiles $(date '+%Y-%m-%d %H:%M:%S')"
git push

echo "==> Done! Dotfiles pushed."
