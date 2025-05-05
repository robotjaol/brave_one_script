#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Harap jalankan sebagai root: sudo $0"
   exit 1
fi

SOURCE_FILE="/etc/apt/sources.list.d/brave-browser-release.list"
KEYRING_PATH="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
NEW_LINE="deb [arch=amd64 signed-by=${KEYRING_PATH}] https://brave-browser-apt-release.s3.brave.com/ stable main"

# Cek apakah file sumber ada
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "File $SOURCE_FILE tidak ditemukan."
    exit 1
fi

# changes
sed -i "s|^deb \[.*signed-by=${KEYRING_PATH}.*\] https://brave-browser-apt-release.s3.brave.com/ stable main|${NEW_LINE}|" "$SOURCE_FILE"

# confirm
echo "File $SOURCE_FILE telah diperbarui."
apt update
