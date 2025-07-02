#!/bin/bash
# Configuration
INTERFACE="wlp1s0"  # Remplace par l'interface réseau à écouter
FILTER="broadcast"  # Filtre BPF pour tcpdump pour capturer uniquement les paquets en broadcast
LOG_FILE="/home/lourobert/acaton/test.log"

# Vérifier que tcpdump est installé
if ! command -v tcpdump &> /dev/null; then
    echo "Erreur : tcpdump n'est pas installé."
    exit 1
fi
touch $LOG_FILE;

# Démarrer tcpdump en mode non interactif et enregistrer les logs uniquement pour les paquets broadcast
sudo tcpdump -i "$INTERFACE" $FILTER -l -nn -vv  | tee -a $LOG_FILE
TCPDUMP_PID=$!
# Attendre quelques secondes pour s'assurer que le fichier commence à se remplir
sleep 2

# Vérifier que Loki/Promtail est en cours d'exécution
if ! systemctl is-active --quiet promtail; then
    echo "Erreur : Promtail n'est pas en cours d'exécution."
    kill $TCPDUMP_PID
    exit 1
fi
# Configuration de Promtail (assurez-vous que ce fichier est bien configuré)
# PROMTAIL_CONFIG="/etc/promtail/config.yml"

# Redémarrer Promtail pour prendre en compte le fichier de log (facultatif)
# sudo systemctl restart promtail
echo "Tcpdump est en cours d'exécution (PID: $TCPDUMP_PID) et les logs de broadcast sont envoyés à Loki."
echo "Utilisez 'kill $TCPDUMP_PID' pour arrêter tcpdump."
# Attendre l'arrêt manuel
tail -f "$LOG_FILE"
