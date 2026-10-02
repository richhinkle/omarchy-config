# whats-focused

Press `SUPER + I` to pop up a notification naming the app that has focus. Handy in a tiling window manager, where windows have no title bars.

```
Focused: foot
Class: foot
Running: yazi
Title: Yazi: home
```

The **Running** line walks down the window's process tree, so for a terminal it shows the program running inside it (e.g. Yazi inside `foot`).

## Install

```bash
./install.sh
```

This copies the script to `~/.local/bin/whats-focused` and adds the binding to `~/.config/hypr/bindings.lua`, backing that file up first. It stops if `SUPER + I` is already bound.

## Manual install

1. Copy `whats-focused` to `~/.local/bin/` and `chmod +x` it.
2. Add to `~/.config/hypr/bindings.lua`:

   ```lua
   o.bind("SUPER + I", "Show focused app", "/home/YOURUSER/.local/bin/whats-focused")
   ```

Use the **full path**. A bind using `~/.local/bin/...` loads without errors but does nothing when pressed.

Requires `jq` (preinstalled on Omarchy).
