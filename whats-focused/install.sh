#!/bin/bash
# Install whats-focused and bind it to SUPER + I in Hyprland.
set -euo pipefail

src="$(cd "$(dirname "$0")" && pwd)/whats-focused"
dest="$HOME/.local/bin/whats-focused"
bindings="$HOME/.config/hypr/bindings.lua"

if omarchy menu keybindings --print 2>/dev/null | grep -qE '^SUPER \+ I '; then
  echo "SUPER + I is already bound on this system. Edit $bindings by hand to pick another key." >&2
  exit 1
fi

mkdir -p "$(dirname "$dest")"
install -m 755 "$src" "$dest"
echo "Installed $dest"

if ! grep -q 'whats-focused' "$bindings"; then
  cp "$bindings" "$bindings.bak.$(date +%s)"
  cat >> "$bindings" <<LUA

-- Show which app has focus
o.bind("SUPER + I", "Show focused app", "$dest")
LUA
  echo "Added SUPER + I binding to $bindings"
fi

hyprctl reload >/dev/null && hyprctl configerrors
echo "Done. Press SUPER + I on any window."
