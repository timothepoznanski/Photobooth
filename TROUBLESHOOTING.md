# Fix Écran Blanc SimpleBooth

Si vous avez un écran blanc après installation, voici la solution qui fonctionne :

```bash
# 1. Réparer la dépendance Pi Camera
sudo apt reinstall liblerc4

# 2. Redémarrage propre
sudo systemctl stop simplebooth-kiosk.service
sudo pkill -f chromium
rm -rf /home/admin/.config/simplebooth-profile
mkdir -p /home/admin/.config/simplebooth-profile
sudo systemctl start simplebooth-kiosk.service
```

## Vérification

```bash
# Vérifier les logs - doit afficher ces messages :
sudo journalctl -u simplebooth-kiosk.service -f

# Chercher :
# "[CAMERA] Démarrage de la Pi Camera..."
# "GET /video_stream HTTP/1.1" 200
```

Si ça ne marche toujours pas :

```bash
# Tester la caméra
rpicam-hello --timeout 2000

# Si erreur, installer les outils :
sudo apt install -y rpicam-apps libcamera-tools
```
