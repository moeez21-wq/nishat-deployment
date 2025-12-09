#!/usr/bin/env bash
set -e

# === INSTALL EXACTLY AS EXECUTED ===
pip install --break-system-packages onnxruntime-gpu onnx onnxslim

apt-get install -y wget

wget https://developer.download.nvidia.com/compute/machine-learning/tensorrt/10.7.0/local_repo/nv-tensorrt-local-repo-ubuntu2404-10.7.0-cuda-12.6_1.0-1_amd64.deb?t=eyJscyI6ImdzZW8iLCJsc2QiOiJodHRwczovL3d3dy5nb29nbGUuY29tLyIsIm5jaWQiOiJzby10d2l0LTI2NjgzMSJ9

dpkg -i 'nv-tensorrt-local-repo-ubuntu2404-10.7.0-cuda-12.6_1.0-1_amd64.deb?t=eyJscyI6ImdzZW8iLCJsc2QiOiJodHRwczovL3d3dy5nb29nbGUuY29tLyIsIm5jaWQiOiJzby10d2l0LTI2NjgzMSJ9'

cp /var/nv-tensorrt-local-repo-ubuntu2404-10.7.0-cuda-12.6/nv-tensorrt-local-*-keyring.gpg /usr/share/keyrings/

apt-get update

apt install -y \
  libnvinfer10=10.7.0.23-1+cuda12.6 \
  libnvinfer-plugin10=10.7.0.23-1+cuda12.6 \
  libnvinfer-vc-plugin10=10.7.0.23-1+cuda12.6 \
  libnvinfer-lean10=10.7.0.23-1+cuda12.6 \
  libnvinfer-dispatch10=10.7.0.23-1+cuda12.6 \
  libnvonnxparsers10=10.7.0.23-1+cuda12.6 \
  libnvinfer-bin=10.7.0.23-1+cuda12.6 \
  libnvinfer-dev=10.7.0.23-1+cuda12.6 \
  libnvinfer-lean-dev=10.7.0.23-1+cuda12.6 \
  libnvinfer-plugin-dev=10.7.0.23-1+cuda12.6 \
  libnvinfer-vc-plugin-dev=10.7.0.23-1+cuda12.6 \
  libnvinfer-dispatch-dev=10.7.0.23-1+cuda12.6 \
  libnvonnxparsers-dev=10.7.0.23-1+cuda12.6 \
  libnvinfer-samples=10.7.0.23-1+cuda12.6 \
  libnvinfer-headers-dev=10.7.0.23-1+cuda12.6 \
  libnvinfer-headers-plugin-dev=10.7.0.23-1+cuda12.6 \
  python3-libnvinfer=10.7.0.23-1+cuda12.6 \
  python3-libnvinfer-dev=10.7.0.23-1+cuda12.6 \
  python3-libnvinfer-lean=10.7.0.23-1+cuda12.6 \
  python3-libnvinfer-dispatch=10.7.0.23-1+cuda12.6
