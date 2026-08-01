FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache ffmpeg python3 py3-pip
RUN pip3 install edge-tts --break-system-packages
USER node
