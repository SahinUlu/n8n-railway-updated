FROM alpine:latest AS alpine

FROM n8nio/n8n:latest

# Alpine'den apk paket yöneticisini ve bağımlılıklarını kopyalıyoruz
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/
COPY --from=alpine /lib/libc.musl-x86_64.so.1 /lib/
COPY --from=alpine /etc/apk /etc/apk
COPY --from=alpine /lib/apk /lib/apk

USER root

# 1. Gerekli sistem paketlerini yüklüyoruz (py3-venv yerine doğru paket adı: py3-virtualenv)
RUN apk add --no-cache ffmpeg python3 py3-pip py3-virtualenv

# 2. Edge-TTS için izole bir Python sanal ortamı kuruyoruz
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir edge-tts

# 3. Edge-TTS ve FFmpeg'in sistem geneline erişilebilir olmasını sağlıyoruz
ENV PATH="/opt/venv/bin:$PATH"

USER node
