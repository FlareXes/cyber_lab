#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo"
    exit 1
fi

# Create a JKLU Docker network if it doesn't exist
if ! docker network inspect jklu_cyber_lab >/dev/null 2>&1; then
    echo "Creating Docker network jklu_cyber_lab..."
    docker network create jklu_cyber_lab
fi

if [[ $1 == "up" ]]; then
    for file in $(find . -type f -name 'docker-compose.yml'); do
        echo "Starting containers in $file..."
        docker-compose -f "$file" up -d
    done
    
    echo "Modifying Apache configuration for DVWA..."
    docker exec jklu_dvwa sed -i 's/80/27000/g' /etc/apache2/sites-available/000-default.conf
    docker exec jklu_dvwa sed -i 's/80/27000/g' /etc/apache2/ports.conf
    docker exec jklu_dvwa service apache2 restart

    # Update /etc/hosts if entry does not exist
    grep -qxF "127.0.0.1  dvwa.jklu.local" /etc/hosts || echo "127.0.0.1  dvwa.jklu.local" >> /etc/hosts
    grep -qxF "127.0.0.1  attacker.jklu.local" /etc/hosts || echo "127.0.0.1  attacker.jklu.local" >> /etc/hosts
elif [[ $1 == "down" ]]; then
    for file in $(find . -type f -name 'docker-compose.yml'); do
        echo "Stopping containers in $file..."
        docker-compose -f "$file" down
    done
else
    echo "Usage: $0 [up|down]"
    exit 1
fi

