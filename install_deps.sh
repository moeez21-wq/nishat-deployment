./install_docker.sh
./install_drivers.sh
./install_cuda.sh
./install_tensorrt.sh
./install_container_toolkit.sh

read -p "GitHub Username: " USERNAME
read -sp "GitHub Token: " TOKEN
echo
cat <<EOF > ~/.git-credentials
https://$USERNAME:$TOKEN@github.com
EOF
git config --global credential.helper store

git clone https://github.com/Swati-Technologies/secureye-nishat-fe.git
cd secureye-nishat-fe
git checkout webrtc-stream-test
cd ..

git clone https://github.com/Swati-Technologies/secureye-nishat-rtsp.git
cd secureye-nishat-rtsp
git checkout restart-changes
cd ..

git clone https://github.com/Swati-Technologies/secureye-nishat-be.git

cp -r secureye-nishat-be/rtsp-simple-server.yaml .
docker run --rm -dit   --name d-rtsp-server   -v "$PWD/rtsp-simple-server.yaml":/mediamtx.yml   -p 8554:8554   -p 5010:5010/udp   -p 5012:5012/udp   -p 5014:5014/udp -p 5016:5016/udp   bluenviron/mediamtx

cd secureye-nishat-be
git checkout tracker-nishat


echo 'Make changes in code i.e. adding env, modifying IP address etc.'
