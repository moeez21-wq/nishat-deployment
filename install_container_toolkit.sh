#!/bin/bash
set -e

echo "----------------------------------------------"
echo " Installing NVIDIA Container Toolkit for Docker"
echo "----------------------------------------------"

# Step 1: Install prerequisites
sudo apt-get update -y
sudo apt-get install -y curl gnupg lsb-release

# Step 2: Add NVIDIA Container Toolkit repository
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
    sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit.gpg

curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit.gpg] https://#' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list > /dev/null

# Step 3: Update package lists
sudo apt-get update -y

# Step 4: Install NVIDIA Container Toolkit
sudo apt-get install -y nvidia-container-toolkit

# Step 5: Configure Docker runtime
sudo nvidia-ctk runtime configure --runtime=docker

# Step 6: Restart Docker
sudo systemctl restart docker

echo "----------------------------------------------"
echo " NVIDIA Container Toolkit Installed Successfully!"
echo "----------------------------------------------"
echo "Test with:"
echo "    sudo docker run --rm --gpus all nvidia/cuda:12.6.0-base nvidia-smi"
echo "----------------------------------------------"
