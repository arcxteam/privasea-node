#!/bin/bash

# Nama file: install-docker.sh
# Deskripsi: Script untuk menginstal Docker CE dan Docker Compose v2 versi terbaru pada Ubuntu.

set -e

echo "Memulai proses instalasi Docker dan Docker Compose..."

# Update dan install dependensi
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Menambahkan Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Menambahkan repository Docker ke apt sources
echo "Menambahkan repository Docker ke apt sources..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update dan install Docker
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin

# Install Docker Compose Plugin sebagai cadangan
sudo apt-get install -y docker-compose-plugin

# Mendapatkan versi terbaru Docker Compose dari GitHub
echo "Mengunduh dan menginstal Docker Compose versi terbaru..."
DOCKER_COMPOSE_VERSION=$(curl -fsSL https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Memberikan hak eksekusi ke Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Verifikasi instalasi Docker dan Docker Compose
echo "Memverifikasi instalasi..."
docker --version
docker compose version

echo "Instalasi Docker dan Docker Compose selesai!"
