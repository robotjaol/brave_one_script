#!/bin/bash
set -e

# Step 1: Install curl if not already installed
sudo apt update
sudo apt install -y curl

# Step 2: Download Brave's GPG key and place it in the keyrings directory
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Step 3: Add Brave's repository to the APT sources list
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" \
  | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

# Step 4: Update package list
sudo apt update

# Step 5: Install Brave Browser
sudo apt install -y brave-browser

# Completion message
echo "Brave Browser installation completed."
