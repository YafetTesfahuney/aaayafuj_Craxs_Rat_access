# Purpose: Remote Access Tool (RAT) for educational and ethical testing purposes. 
* Fully featured for monitoring, keylogging, remote shell, webcam access, and file browser (depending on target OS).

# 💣 Step-by-Step Script: aaayafuj_Craxs_Rat_access.sh
`🖥️` Main Features`:`
* Remote Shell Access
* Keystroke Logging
* Webcam Capture
* File Browser
* Persistence (optional)
* Web Dashboard (optional with Flask)
* Works over WAN/LAN
* Encrypted communication (TLS with self-signed cert)

# 📦 Dependencies
    sudo apt update && sudo apt install -y git python3 python3-pip openssl build-essential
    pip3 install Flask pyxhook pynput opencv-python cryptography

* Replace <YOUR_IP> with your public IP or use tools like ngrok for WAN exposure.

# 🔒 Create Self-Signed SSL Cert (Optional for HTTPS)
    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
* Add `ssl_context=('cert.pem'`, `'key.pem`') to `app.run`(...) in the server if you want encryption.

# 📁 File Structure
    aaayafuj_Craxs_Rat_access/
    ├── rat_server.py
    ├── rat_client.py
    ├── README.md
    └── aaayafuj_Craxs_Rat_access.sh
