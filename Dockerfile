FROM n8nio/n8n:latest

USER root

# Sistemde hangi paket yöneticisi var tespit ediyoruz
RUN which apk || which apt-get || which yum || true

USER node
