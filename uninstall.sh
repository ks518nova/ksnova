# 🧹 KS Nova Full Uninstall (Global + Home)
sudo rm -f /usr/local/bin/ksn /usr/local/bin/ksnova-linux 2>/dev/null
rm -rf "$HOME/.ksnova" "$HOME/ks_local" ./ksnova-linux 2>/dev/null
sed -i '/\.ksnova\/bin/d' ~/.bashrc ~/.profile ~/.zshrc 2>/dev/null
unhash ksn 2>/dev/null || true
hash -r


if command -v ksn >/dev/null 2>&1; then
    echo "✅ KS Nova uninstallation successful!"
else
    echo "❌ Failed to uninstall KS Nova try again"
    echo "🔗 Visit the official site for manual uninstallation: https://github.com/KSWarrior/ksnova"
    exit 1
fi
