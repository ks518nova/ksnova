#!/usr/bin/env bash

KS_DIR="$HOME/ks_local"
KS_BIN="$KS_DIR/bin"
KS_PACKAGES="$KS_DIR/packages"

mkdir -p "$KS_BIN" "$KS_PACKAGES"

RAW_BASE="https://raw.githubusercontent.com/ks518nova/ksnova/main"

case "$1" in
  install)
    echo "📥 Running latest install.sh from KS Nova server..."
    curl -fsSL "$RAW_BASE/install.sh" | bash -s -- "$2"
    ;;
  
  update)
    echo "📥 Running latest update.sh from KS Nova server..."
    curl -fsSL "$RAW_BASE/update.sh" | bash -s -- "$2"
    ;;
  
  uninstall)
    echo "📥 Running latest uninstall.sh from KS Nova server..."
    curl -fsSL "$RAW_BASE/uninstall.sh" | bash -s -- "$2"
    ;;
  
  list)
    echo "Available packages:"
    echo "  pterodactyl_panel"
    echo "  pterodactyl_wings"
    echo "  puffer_panel"
    ;;
  
  *)
    echo "Usage: ks <install|update|uninstall|list> [package]"
    ;;
esac
