#!/usr/bin/env bash
set -uo pipefail

PACKAGES=(git stow eza fastfetch bash-completion sudo nano make)
FAILED=0

echo "==> Packages"
for pkg in "${PACKAGES[@]}"; do
  if pacman -Qq "$pkg" >/dev/null 2>&1; then
    printf '  [ok]      %s\n' "$pkg"
  else
    printf '  [missing] %s\n' "$pkg"
    FAILED=1
  fi
done

echo
echo "==> Git identity"
name="$(git config --global user.name  || true)"
mail="$(git config --global user.email || true)"
if [[ -n "$name" ]]; then
  printf '  [ok]      user.name  = %s\n' "$name"
else
  printf '  [missing] user.name\n'
  FAILED=1
fi
if [[ -n "$mail" ]]; then
  printf '  [ok]      user.email = %s\n' "$mail"
else
  printf '  [missing] user.email\n'
  FAILED=1
fi

echo
echo "==> ble.sh"
if [[ -f "$HOME/.local/share/blesh/ble.sh" ]]; then
  printf '  [ok]      %s\n' "$HOME/.local/share/blesh/ble.sh"
else
  printf '  [missing] %s\n' "$HOME/.local/share/blesh/ble.sh"
  FAILED=1
fi

echo
if [[ $FAILED -eq 0 ]]; then
  echo "All checks passed. Run ./install.sh"
  exit 0
else
  echo "Some checks failed. Fix the issues above, then re-run ./check.sh"
  exit 1
fi
