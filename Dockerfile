FROM n8nio/n8n:latest

USER root

# PIP sistem paket kısıtlamasını kaldırıyoruz
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Gereksinimleri yüklüyoruz
RUN apk add --no-cache ffmpeg python3 py3-pip && \
    pip3 install --no-cache-dir edge-tts

# Volume izin sorunlarını aşmak için root ile başlatıyoruz
USER root
