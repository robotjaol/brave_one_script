#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root: sudo $0"
    exit 1
fi

echo "Step 1: Removing Google Chrome package..."
apt remove --purge google-chrome-stable -y

echo "Step 2: Removing user configuration and cache..."
USER_HOME=$(eval echo ~${SUDO_USER})
rm -rf "$USER_HOME/.config/google-chrome/"
rm -rf "$USER_HOME/.cache/google-chrome/"

echo "Step 3: Removing Chrome repository and signing key..."
rm -f /etc/apt/sources.list.d/google-chrome.list
rm -f /etc/apt/trusted.gpg.d/google-linux-signing-key.gpg

echo "Step 4: Updating apt package index..."
apt update
