#!/bin/bash

# Hibernation check interval in seconds
INTERVAL=60

while true; do
    # Check if there are any players online
    PLAYER_COUNT=$(mcstatus 127.0.0.1:${SERVER_PORT} status | grep -oP 'players: \K[0-9]+')
    
    if [ "$PLAYER_COUNT" -eq "0" ]; then
        echo "No players online. Stopping server..."
        rcon-cli stop
        exit 0
    fi
    
    # Wait for the specified interval before checking again
    sleep $INTERVAL
done
