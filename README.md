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

 # +--- fender
    * banner
    *                                          .|';                    .|'''',                                 '||'''|,           ||                                               
    *                                           ||               ''     ||                                       ||   ||           ||                                               
    *  '''|.   '''|.   '''|.  '||  ||`  '''|.  '||'  '||  ||`    ||     ||      '||''|  '''|.  \\  // (''''      ||...|'  '''|.  ''||''       '''|.  .|'', .|'', .|''|, ('''' ('''' 
    * .|''||  .|''||  .|''||   `|..||  .|''||   ||    ||  ||     ||     ||       ||    .|''||    ><    `'')      || \\   .|''||    ||        .|''||  ||    ||    ||..||  `'')  `'') 
    * `|..||. `|..||. `|..||.      ||  `|..||. .||.   `|..'|.    ||     `|....' .||.   `|..||. //  \\ `...'     .||  \\. `|..||.   `|..'     `|..||. `|..' `|..' `|...  `...' `...' 
    *                           ,  |'                            || ....                                    ....                                                             
    *                             ''                           `..|'       
# 📦 Dependencies
    sudo apt update && sudo apt install -y git python3 python3-pip openssl build-essential
    pip3 install Flask pyxhook pynput opencv-python cryptography

* Replace <YOUR_IP> with your public IP or use tools like ngrok for WAN exposure.

# 🔒 Create Self-Signed SSL Cert (Optional for HTTPS)
    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
* Add `ssl_context=('cert.pem'`, `'key.pem`') to `app.run`(...) in the server if you want encryption.

# 📁 File Structure
    aaayafuj_Craxs_Rat_access/
    |__ aaayafuj_terminal.py
    ├── rat_server.py
    ├── rat_client.py
    ├── README.md
    └── aaayafuj_Craxs_Rat_access.sh



# 📜 Shell Installer: `aaayafuj_Craxs_Rat_access.sh`
    chmod +x aaayafuj_Craxs_Rat_access.sh
    ./aaayafuj_Craxs_Rat_access.sh
    bash ./aaayafuj_Craxs_Rat_access.sh
    
`Open Terminal:`
# 🚀 Upload to GitHub (Manual Steps)
    cd ~/Desktop
    mkdir aaayafuj_Craxs_Rat_access && cd aaayafuj_Craxs_Rat_access
    # Save your files here
    git init
    git remote add origin https://github.com/YafetTesfahuney/aaayafuj_Craxs_Rat_access.git
    git add .
    git commit -m "Initial commit: aaayafuj_Craxs_Rat_access tool"
    git branch -M main
    git push -u origin main
# 🛡️ Disclaimer for README.md
    # aaayafuj_Craxs_Rat_access

`This tool is intended **strictly for educational and authorized security testing purposes only**.  
Unauthorized use is prohibited and may be illegal. The developers take no responsibility for misuse.`

## Features
* `- Remote Shell`
* `- File Upload/Download`
* `- Keystroke Logging`
* `- Webcam Access`
* `- Persistence`
    
