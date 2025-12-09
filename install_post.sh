cd secureye-nishat-fe
docker compose up --build -d
cd ..

cd secureye-nishat-rtsp
docker compose up --build -d
cd ..

cd secureye-nishat-be
docker compose up --build -d
cd ..
