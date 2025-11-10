# 🎛️ Contrôle de l'Application SimpleBooth

## 📋 État des Services

### Vérifier l'état
```bash
# Vérifier si Flask fonctionne
curl -s http://localhost:5000/api/slideshow || echo "Flask arrêté"

# Vérifier le service kiosk
sudo systemctl status simplebooth-kiosk.service

# Voir les processus Python
ps aux | grep python | grep app.py
```

## ▶️ Démarrer l'Application

### 1. Démarrer Flask seulement
```bash
cd /home/admin/SimpleBooth
source venv/bin/activate
python app.py
```

### 2. Démarrer Flask en arrière-plan
```bash
cd /home/admin/SimpleBooth
source venv/bin/activate
nohup python app.py > app.log 2>&1 &
```

### 3. Démarrer le mode Kiosk (Chromium plein écran)
```bash
sudo systemctl start simplebooth-kiosk.service
```

## ⏹️ Arrêter l'Application

### 1. Arrêter Flask
```bash
sudo pkill -f "python.*app.py"
```

### 2. Arrêter le mode Kiosk
```bash
sudo systemctl stop simplebooth-kiosk.service
```

### 3. Arrêt complet (Flask + Kiosk)
```bash
sudo pkill -f "python.*app.py"
sudo systemctl stop simplebooth-kiosk.service
```

## 🔄 Redémarrer l'Application

### Redémarrage complet
```bash
# Arrêter tout
sudo pkill -f "python.*app.py"
sudo systemctl stop simplebooth-kiosk.service

# Attendre 2 secondes
sleep 2

# Redémarrer Flask
cd /home/admin/SimpleBooth
source venv/bin/activate
nohup python app.py > app.log 2>&1 &

# Redémarrer le kiosk (optionnel)
sudo systemctl start simplebooth-kiosk.service
```

## 🌐 Accès aux Pages

- **Interface principale** : `http://IP_RASPBERRY:5000/`
- **Gestion photos** : `http://IP_RASPBERRY:5000/photos`
- **Administration** : `http://IP_RASPBERRY:5000/admin`

## 📝 Logs et Diagnostic

### Voir les logs Flask
```bash
tail -f /home/admin/SimpleBooth/app.log
```

### Voir les logs du service kiosk
```bash
sudo journalctl -u simplebooth-kiosk.service -f
```

### Diagnostic réseau
```bash
# Vérifier les ports ouverts
sudo ss -tlnp | grep :5000

# Tester la connectivité
curl -v http://localhost:5000/
```

## ⚠️ Notes Importantes

1. **Cache Chromium** : Si tu vois encore le diaporama après avoir arrêté Flask, c'est que Chromium affiche la page en cache. Il faut arrêter le service kiosk.

2. **Processus défunts** : Parfois des processus Python restent en mode "defunct". Ils n'affectent pas le fonctionnement mais peuvent être nettoyés avec `sudo pkill -9`.

3. **Service auto-start** : Le service kiosk est configuré pour démarrer automatiquement au boot. Pour le désactiver :
   ```bash
   sudo systemctl disable simplebooth-kiosk.service
   ```

4. **Modifications des templates** : Après modification des fichiers HTML/CSS/JS, il faut redémarrer Flask pour voir les changements.

## 🆘 Dépannage Rapide

### L'application ne répond plus
```bash
sudo pkill -9 -f "python.*app.py"
cd /home/admin/SimpleBooth && source venv/bin/activate && python app.py
```

### Écran noir ou figé
```bash
sudo systemctl restart simplebooth-kiosk.service
```

### Port 5000 occupé
```bash
sudo lsof -i :5000
# Puis tuer le processus avec sudo kill -9 PID
```