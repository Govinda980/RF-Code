# ---------------------------
# 1️⃣ List all Docker images
docker images

# 2️⃣ List all running containers
docker ps

# 3️⃣ List all containers (running + stopped)
docker ps -a

# 4️⃣ Build a Docker image
docker build --no-cache -t robot-google-headless .

# 5️⃣ Run a container
docker run --rm -v ${PWD}/reports:/robot/reports robot-google-headless

# 6️⃣ Run container in background (detached mode)
docker run -d -v ${PWD}/reports:/robot/reports --name rf_container robot-google-headless

# 7️⃣ Stop a running container
docker stop rf_container

# 8️⃣ Remove a container
docker rm rf_container

# 9️⃣ Remove an image
docker rmi robot-google-headless

# 🔟 Tag an image for Docker Hub
docker tag robot-google-headless govinda520/robot-google-headless:latest

# 1️⃣1️⃣ Push image to Docker Hub
docker login
docker push govinda520/robot-google-headless:latest

# 1️⃣2️⃣ Pull image from Docker Hub
docker pull govinda520/robot-google-headless:latest
