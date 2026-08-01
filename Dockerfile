FROM n8nio/n8n:latest

USER root

# 1. FFmpeg ve FFprobe'u hazır statik binary olarak çekiyoruz
COPY --from=mwader/static-ffmpeg:latest /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg:latest /ffprobe /usr/local/bin/

# 2. Alpine depolarından Python ve Pip kurup edge-tts'i yüklüyoruz (py3-venv olmadan)
RUN apk add --no-cache python3 py3-pip && \
    pip install --no-cache-dir --break-system-packages edge-tts

# 3. Railway Volume izin sorunlarını engellemek için root yetkisini koruyoruz
USER root
