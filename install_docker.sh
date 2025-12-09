#!/bin/bash

set -e

echo "----------------------------------------"
echo "   Installing Docker on Ubuntu"
echo "----------------------------------------"

# Step 1: Remove old versions
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Step 2: Update system
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Step 3: Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Step 4: Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Install Docker Engine + CLI
sudo apt-get update -y
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Step 6: Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Step 7: Add current user to docker group (no sudo needed)
sudo usermod -aG docker $USER || true

echo "----------------------------------------"
echo " Docker installation completed!"
echo " Log out and log back in to use Docker without sudo."
echo "----------------------------------------"

docker --version
docker compose version
