#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

STOW_PACKAGES=(bash blesh eza fastfetch)

# Remove anything already sitting where stow wants to link.
# Walks every file and symlink inside each stow package and mirrors the
# relative path under $HOME.
for pkg in "${STOW_PACKAGES[@]}"; do
  while IFS= read -r -d '' src; do
    rel="${src#"$pkg"/}"
    rm -rf "$HOME/$rel"
  done < <(find "$pkg" \( -type f -o -type l \) -print0)
done

stow --restow --no-folding --target="$HOME" "${STOW_PACKAGES[@]}"

echo
echo "Dotfiles stowed. Restart your shell with: exec bash"
