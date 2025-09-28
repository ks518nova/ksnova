#!/usr/bin/env bash

# KS CLI - Main Script
# Handles install, update, uninstall, list, and help commands.

KS_DIR="$HOME/ks_local"
KS_BIN="$KS_DIR/bin"
KS_PACKAGES="$KS_DIR/packages"

# Ensure directories exist
mkdir -p "$KS_BIN" "$KS_PACKAGES"

case "$1" in
  install)
    PACKAGE="$2"
    if [[ -z "$PACKAGE" ]]; then
      echo "❌ No package specified. Usage: ks install <PackageName>"
      exit 1
    fi

    case "$PACKAGE" in
      Pterodactyl_Panel)
        echo "📦 Installing Pterodactyl Panel..."
        # Example installation steps
        sudo apt update && sudo apt install -y docker docker-compose
        echo "✅ Pterodactyl Panel installed!"
        ;;
      Puffer_Panel)
        echo "📦 Installing PufferPanel..."
        sudo bash <(curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh)
        sudo apt update && sudo apt install -y pufferpanel
        sudo pufferpanel user add --admin admin --password admin
        echo "✅ PufferPanel installed!"
        ;;
      *)
        echo "❌ Unknown package: $PACKAGE"
        ;;
    esac
    ;;
  update)
    echo "🔄 Updating KS..."
    # You can replace this with your actual KS update mechanism
    sudo apt update && sudo apt upgrade -y ks
    echo "✅ KS updated!"
    ;;
  uninstall)
    echo "🗑️ Uninstalling KS..."
    sudo apt remove -y ks
    echo "✅ KS removed!"
    ;;
  list)
    echo "📋 Available packages:"
    echo " - Pterodactyl_Panel"
    echo " - Puffer_Panel"
    ;;
  help|*)
    echo "🔧 KS CLI"
    echo "Usage: ks <command> [package]"
    echo ""
    echo "Commands:"
    echo "  install <Package>   Install a package (Pterodactyl_Panel, Puffer_Panel)"
    echo "  update              Update KS to the latest version"
    echo "  uninstall           Remove KS from the system"
    echo "  list                List available packages"
    echo "  help                Show this help message"
    ;;
esac
