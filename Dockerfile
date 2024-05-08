# Gunakan image Ubuntu LTS terbaru sebagai image dasar
FROM ubuntu:20.04

# Update daftar paket dan instal dependensi yang diperlukan
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y nodejs \
    && apt-get install -y npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Buat direktori proyek Anda di dalam kontainer
WORKDIR /opt/oss

# Salin file server.js dan package.json ke dalam kontainer
COPY server.js package.json ./

# Instal dependensi Node.js dari package.json
RUN npm install

# Tentukan port yang akan digunakan oleh aplikasi Anda
EXPOSE 80

# Jalankan server Node.js saat kontainer dimulai
CMD ["node", "server.js"]

