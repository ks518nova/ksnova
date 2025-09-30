#!/usr/bin/env bash

RAW_BASE="https://raw.githubusercontent.com/ks518nova/ksnova/main/actions/install"

case "$1" in
  pterodactyl|puffer|drogen)
    echo "📥 Running latest panel.sh from KS Nova server for $1..."
    curl -fsSL "$RAW_BASE/minecraft.sh" | bash -s -- "${@:1}"
    ;;
  
  *)
    echo "Usage: ks <pterodactyl|Puffer|drogen> [options]"
    ;;
esac
