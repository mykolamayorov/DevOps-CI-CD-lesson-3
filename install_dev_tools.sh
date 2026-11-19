#!/bin/bash

set -e

if ! command -v docker > /dev/null 2>&1; then
    echo "Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
else
    echo "Docker is already installed."
fi

if ! docker compose version > /dev/null 2>&1; then
    echo "Installing Docker Compose..."
    sudo apt update
    sudo apt install -y docker-compose-v2
else
    echo "Docker Compose is already installed."
fi

if ! command -v python3 > /dev/null 2>&1; then
    echo "Installing Python..."
    sudo apt update
    sudo apt install -y python3 python3-pip python3-venv
else
    echo "Python is already installed."
fi

if [ ! -f "$HOME/django-venv/bin/django-admin" ]; then
    echo "Installing Django..."
    sudo apt install -y python3-venv
    python3 -m venv "$HOME/django-venv"
    "$HOME/django-venv/bin/pip" install django
else
    echo "Django is already installed."
fi

echo
echo "Installation completed."

docker --version
docker compose version
python3 --version
"$HOME/django-venv/bin/django-admin" --version
