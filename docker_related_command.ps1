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



docker build --no-cache -t robot-google-headless .
           --no-cache → ensures a fresh build (no old layers are reused)
           -t robot-google-headless → tags the image locally
docker run --rm `
 -v ${PWD}/reports:/robot/reports `
 robot-google-headless

(.venv) PS C:\Python\RF-Code> docker tag robot-google-headless govinda520/robot-google-headless:latest
           govinda520 → your Docker Hub username
            robot-google-headless → repository name
            latest → tag
 (.venv) PS C:\Python\RF-Code> docker push govinda520/robot-google-headless:latest

dockerhubtoken--> dckr_pat_ud-PErWAUOyS6qbR1O8amCskZ3w


Standard way to push code into docker
    Checkout
       ↓
    Build Docker image
       ↓
    Run tests INSIDE container
       ↓
    IF tests pass → Push to Docker Hub
    IF tests fail → STOP (no push)
