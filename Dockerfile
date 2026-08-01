FROM n8nio/n8n:latest

USER root

# Media işleme araçlarını ve Edge-TTS'i yüklüyoruz
RUN apk add --no-cache ffmpeg python3 py3-pip && \
    pip3 install edge-tts --break-system-packages

# Klasör izinlerini yapılandırıyoruz
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Railway Volume izin hatasını (EACCES) önlemek için root yetkisiyle çalıştırıyoruz
USER root
