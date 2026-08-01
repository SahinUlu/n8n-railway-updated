FROM n8nio/n8n:latest

USER root

# 1. Debian paket yöneticisi (apt-get) ile FFmpeg ve Python yüklüyoruz
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# 2. Edge-TTS kütüphanesini yüklüyoruz
RUN pip3 install --no-cache-dir --break-system-packages edge-tts

# 3. Railway Volume izin hatasını (EACCES) önlemek için root olarak çalıştırıyoruz
USER root
