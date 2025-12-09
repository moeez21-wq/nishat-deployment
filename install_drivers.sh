#!/bin/bash
set -e

echo "----------------------------------------"
echo " Installing NVIDIA Driver 560.35.03"
echo " Target: Ubuntu 22.04"
echo "----------------------------------------"

# Step 1: Update system
sudo apt-get update -y

# Step 2: Install required packages
sudo apt-get install -y wget dkms build-essential linux-headers-$(uname -r)

# Step 3: Download NVIDIA local repo installer
NVIDIA_DEB="nvidia-driver-local-repo-ubuntu2204-560.35.03_1.0-1_amd64.deb"
URL="https://us.download.nvidia.com/tesla/560.35.03/${NVIDIA_DEB}"

echo "Downloading NVIDIA driver package..."
wget -O ${NVIDIA_DEB} ${URL}

# Step 4: Install local NVIDIA repo
echo "Installing NVIDIA local repository..."
sudo dpkg -i ${NVIDIA_DEB}

# Step 5: Add repo key
sudo cp /var/nvidia-driver-local-repo-*/nvidia-driver-local-*.key /usr/share/keyrings/

# Step 6: Update package list
sudo apt-get update -y

# Step 7: Install NVIDIA driver 560.35.03
echo "Installing NVIDIA Driver..."
sudo apt-get install -y nvidia-driver-560

# Step 8: Regenerate initramfs
sudo update-initramfs -u

echo "----------------------------------------"
echo " NVIDIA Driver 560.35.03 Installed Successfully!"
echo " Reboot your system to activate the driver."
echo "----------------------------------------"
