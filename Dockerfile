FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg jq \
    fonts-liberation \
    libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
    libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxrandr2 \
    libgbm1 libasound2 libpangocairo-1.0-0 libgtk-3-0 \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Install ChromeDriver (LAST KNOWN GOOD STABLE)
RUN DRIVER_URL=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json \
    | jq -r '.channels.Stable.downloads.chromedriver[] | select(.platform=="linux64") | .url') && \
    wget -q "$DRIVER_URL" -O /tmp/chromedriver.zip && \
    unzip /tmp/chromedriver.zip -d /tmp && \
    mv /tmp/chromedriver-linux64/chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver && \
    rm -rf /tmp/chromedriver*

RUN pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary

WORKDIR /robot
COPY . /robot

CMD ["robot", "-d", "reports", "tests/google_selenium_features.robot"]


#docker build --no-cache -t robot-google-headless .
        #    --no-cache → ensures a fresh build (no old layers are reused)
        #    -t robot-google-headless → tags the image locally
#docker run --rm `
#  -v ${PWD}/reports:/robot/reports `
#  robot-google-headless

#(.venv) PS C:\Python\RF-Code> docker tag robot-google-headless govinda520/robot-google-headless:latest
        #    govinda520 → your Docker Hub username
        #     robot-google-headless → repository name
        #     latest → tag
 #(.venv) PS C:\Python\RF-Code> docker push govinda520/robot-google-headless:latest

#dockerhubtoken--> dckr_pat_ud-PErWAUOyS6qbR1O8amCskZ3w