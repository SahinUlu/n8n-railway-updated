FROM n8nio/n8n:latest

USER root

# /sbin/apk tam yoluyla Alpine paketlerini kuruyoruz
RUN /sbin/apk add --no-cache ffmpeg python3 py3-pip

# Python Edge-TTS kütüphanesini kuruyoruz
RUN pip3 install edge-tts --break-system-packages

USER node
