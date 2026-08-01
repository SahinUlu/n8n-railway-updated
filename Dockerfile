FROM n8nio/n8n:latest

USER root

# 1. Gerekli sistem paketlerini yüklüyoruz
RUN apk add --no-cache ffmpeg python3 py3-pip

# 2. Edge-TTS için izole bir Python sanal ortamı kuruyoruz
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir edge-tts

# 3. Edge-TTS ve FFmpeg'in sistem geneline erişilebilir olmasını sağlıyoruz
ENV PATH="/opt/venv/bin:$PATH"

# 4. Railway Volume izinlerini (EACCES) bypass etmek için root yetkisiyle çalıştırıyoruz
USER root
