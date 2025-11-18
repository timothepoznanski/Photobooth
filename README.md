# 📸 Photobooth Raspberry Pi

> **Application Flask pour photobooth tactile avec flux vidéo temps réel et capture instantanée**

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Flask](https://img.shields.io/badge/Flask-2.3.3-green.svg)
![Raspberry Pi](https://img.shields.io/badge/Raspberry%20Pi-Compatible-red.svg)
![OpenCV](https://img.shields.io/badge/OpenCV-Support%20USB-brightgreen.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## 🎯 Aperçu

### Matériel supporté

- Raspberry pi 4
- [Alimentation Raspberry Pi 5](https://amzlink.to/az01ijEmlFqxT)
- [Pi Camera 3](https://amzlink.to/az0eEXwhnxNvO)
- [Imprimante Thermique (AliExpress)](https://s.click.aliexpress.com/e/_oFyCgCI)
- [Ecran Waveshare (Amazon)](https://amzlink.to/az03G4UMruNnc)

### Installation

Après un `git clone`, vous pouvez installer SimpleBooth automatiquement :

```bash
cd SimpleBooth
sudo ./setup.sh  # Installation interactive complète
```

**Accéder à l'interface :**

   - Ouvrir un navigateur sur `http://localhost:5000`
   - Ou depuis un autre appareil : `http://[IP_RASPBERRY]:5000`

**Pages disponibles :**
   - `/` : Interface principale du photobooth
   - `/photos` : Galerie de gestion des photos
   - `/admin` : Panneau d'administration complet

## Configuration

La configuration est sauvegardée dans `config.json`