#!/usr/bin/env bash
export GNOME_KEYRING_CONTROL=""
export SSH_AUTH_SOCK=""

# Nettoyer agressivement les instances Chromium existantes et leurs fichiers de lock
echo "Nettoyage des instances Chromium..."
pkill -9 -f chromium 2>/dev/null || true
pkill -9 -f chrome 2>/dev/null || true

# Supprimer les fichiers de lock Chromium
rm -f ~/.config/chromium/SingletonLock 2>/dev/null || true
rm -f ~/.config/chromium/SingletonSocket 2>/dev/null || true
rm -rf ~/.config/chromium/Singleton* 2>/dev/null || true

# Attendre que les processus se terminent
sleep 3

# Vérifier que Chromium n'est plus en cours d'exécution
if pgrep -f chromium >/dev/null || pgrep -f chrome >/dev/null; then
    echo "Erreur: Impossible de tuer Chromium, abandon."
    exit 1
fi

echo "Chromium nettoyé avec succès."

xset s off dpms s noblank
unclutter -idle 0.1 -root &
cd "/home/admin/SimpleBooth"
source "/home/admin/SimpleBooth/venv/bin/activate"
python app.py &
sleep 5

# Vérifier que l'app Flask répond avant de lancer Chromium
if ! curl -s --max-time 5 http://localhost:5000/ >/dev/null; then
    echo "Erreur: L'application Flask ne répond pas sur localhost:5000"
    exit 1
fi

echo "Application Flask prête, lancement de Chromium..."

exec chromium --kiosk --no-sandbox --disable-infobars \
  --disable-features=TranslateUI,Translate \
  --disable-translate \
  --disable-extensions \
  --disable-plugins \
  --disable-notifications \
  --disable-popup-blocking \
  --disable-default-apps \
  --disable-background-mode \
  --disable-background-timer-throttling \
  --disable-backgrounding-occluded-windows \
  --disable-renderer-backgrounding \
  --disable-field-trial-config \
  --disable-ipc-flooding-protection \
  --no-default-browser-check \
  --no-first-run \
  --disable-component-update \
  --lang=fr \
  --user-data-dir=/tmp/chromium-user-data \
  http://localhost:5000
