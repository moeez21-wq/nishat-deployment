#!/bin/bash
set -e

echo "----------------------------------------"
echo " Installing CUDA 12.6 (RUNFILE METHOD)"
echo " This will NOT install the NVIDIA driver."
echo "----------------------------------------"

CUDA_RUN="cuda_12.6.0_560.28.03_linux.run"
CUDA_URL="https://developer.download.nvidia.com/compute/cuda/12.6.0/local_installers/${CUDA_RUN}"

# Step 1: Install prerequisites
sudo apt-get update -y
sudo apt-get install -y build-essential wget dkms linux-headers-$(uname -r)

# Step 2: Download CUDA RUN file
echo "Downloading CUDA 12.6 RUNFILE..."
wget -O ${CUDA_RUN} ${CUDA_URL}

# Step 3: Make it executable
chmod +x ${CUDA_RUN}

# Step 4: Run installer WITHOUT driver
echo "Running CUDA installer..."
sudo sh ${CUDA_RUN} --silent --toolkit --override --no-drm --no-opengl-libs

# Step 5: Add environment variables
echo "Configuring PATH and LD_LIBRARY_PATH..."

CUDA_EXPORTS=$(cat << 'EOF'
# >>> CUDA 12.6 PATH >>>
export PATH=/usr/local/cuda-12.6/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64:$LD_LIBRARY_PATH
# <<< CUDA 12.6 PATH <<<
EOF
)

if ! grep -q "CUDA 12.6 PATH" ~/.bashrc; then
    echo "$CUDA_EXPORTS" >> ~/.bashrc
fi

# Step 6: Reload shell
source ~/.bashrc || true

echo "----------------------------------------"
echo " CUDA 12.6 Installed Successfully!"
echo " REBOOT your system now."
echo "----------------------------------------"

echo "After reboot, verify with:"
echo "   nvcc --version"
echo "   nvidia-smi"
