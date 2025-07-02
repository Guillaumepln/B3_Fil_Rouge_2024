#!/bin/bash

# Adresse de broadcast (à adapter selon ton réseau)
BROADCAST_IP="255.255.255.255"

# Message à envoyer
MESSAGE="Broadcast test packet"

while true; do
    echo "$MESSAGE" | ping -b $BROADCAST_IP
    echo "Paquet envoyé en broadcast à $BROADCAST_IP"
    sleep 10
done