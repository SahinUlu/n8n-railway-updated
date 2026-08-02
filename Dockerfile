FROM alpine:latest AS alpine

FROM n8nio/n8n:latest

COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/
COPY --from=alpine /lib/libc.musl-x86_64.so.1 /lib/
COPY --from=alpine /etc/apk /etc/apk
COPY --from=alpine /lib/apk /lib/apk

USER root

RUN apk add --no-cache ffmpeg python3 py3-pip py3-virtualenv

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir edge-tts youtube-transcript-api

ENV PATH="/opt/venv/bin:$PATH"

# Railway Volume izinlerini (EACCES) bypass etmek için root yetkisiyle çalıştırıyoruz
USER root
