#!/bin/bash
# ==========================================
# TOOL  : BIGBULL TOR IP CHANGER
# BRAND : BIGBULL CHEATS
# OWNER : @bigbull8809 (Telegram)
# STATUS: PREMIUM & PRIVATE
# ==========================================
# WARNING: BIGBULL CHEATS - COPYRIGHT PROTECTED
# UNAUTHORIZED COPY = PERMANENT BAN
# ==========================================

clear
# ONLY BIGBULL ASCII ART IN GOLDEN
echo -e "\e[1;33m"
echo "██████╗░██╗░██████╗░██████╗░██╗░░░██╗██╗░░░░░"
echo "██╔══██╗██║██╔════╝░██╔══██╗██║░░░██║██║░░░░░"
echo "██████╦╝██║██║░░██╗░██████╦╝██║░░░██║██║░░░░░"
echo "██╔══██╗██║██║░░╚██╗██╔══██╗██║░░░██║██║░░░░░"
echo "██████╦╝██║╚██████╔╝██████╦╝╚██████╔╝███████╗"
echo "╚═════╝░╚═╝░╚═════╝░╚═════╝░░╚═════╝░╚══════╝"
echo ""
echo " ██████╗██╗  ██╗███████╗ █████╗ ████████╗███████╗"
echo "██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝"
echo "██║     ███████║█████╗  ███████║   ██║   ███████╗"
echo "██║     ██╔══██║██╔══╝  ██╔══██║   ██║   ╚════██║"
echo "╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████║"
echo " ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝"
echo -e "\e[0m"

# REST ALL COLORFUL AS BEFORE
echo -e "\e[1;33m       🔥 BIGBULL CHEATS OFFICIAL 🔥\e[0m"
echo -e "\e[1;35m       OWNER: @bigbull8809 | 
       JOIN TG CHANNEL  https://t.me/+FWsH8x7Q5I9hMmM1\e[0m"
echo -e "\e[1;36m       ═══════════════════════════════════\e[0m"
echo -e "\e[1;32m       TYPE: BBC V12 PRO \e[0m"
echo -e "\e[1;31m       VERSION: 12.0 PRO   [PAID VERSION]| GOLDEN EDITION\e[0m"
echo ""

# BIGBULL CHEATS - TOR CHECK
if ! command -v tor &> /dev/null
then
    echo -e "\e[1;31m[❌] BIGBULL ERROR: Tor not installed\e[0m"
    echo -e "\e[1;33m[ℹ️ ] BIGBULL SOLUTION: Run 'pkg install tor'\e[0m"
    echo -e "\e[1;35m[👉 ] Contact @bigbull8809 for help\e[0m"
    exit
fi

# BIGBULL CHEATS - STOP ANY EXISTING TOR
echo -e "\e[1;34m[🔄] BIGBULL CHEATS: Cleaning old sessions...\e[0m"
pkill -9 tor 2>/dev/null

# BIGBULL CHEATS - START TOR SERVICE
echo -e "\e[1;36m[⚡] BIGBULL CHEATS: Starting Tor service...\e[0m"
tor > /dev/null 2>&1 &
sleep 7

echo -e "\e[1;32m[✅] BIGBULL SUCCESS: Tor started!\e[0m"
echo -e "\e[1;35m[🌀] BIGBULL IP ROTATION ACTIVATED\e[0m"
echo -e "\e[1;33m[⚠️ ] Press Ctrl+C to stop BIGBULL IP CHANGER\e[0m"
echo ""

# BIGBULL CHEATS - IP ROTATION LOOP
COUNT=1
while true
do
    echo -e "\e[1;37m╔══════════════════════════════════════╗\e[0m"
echo -e "\e[1;31m      BIGBULL CHEATS - STARTED #$COUNT\e[0m"
    echo -e "\e[1;37m╚══════════════════════════════════════╝\e[0m"
    
    # BIGBULL IP CHANGE
    pkill -HUP tor
    sleep 3
    
    # BIGBULL GET NEW IP
    NEW_IP=$(torsocks curl -s https://checkip.amazonaws.com 2>/dev/null)
    
    if [ -z "$NEW_IP" ]; then
        echo -e "\e[1;31m[❌] BIGBULL ERROR: Cannot fetch IP\e[0m"
        echo -e "\e[1;33m[🔄] BIGBULL: Restarting Tor...\e[0m"
        pkill -9 tor
        tor > /dev/null 2>&1 &
        sleep 7
        continue
    fi
    
    # BIGBULL DISPLAY NEW IP
    echo -e "\e[1;32m[✅] BIGBULL IP CHANGED SUCCESSFULLY!\e[0m"
    echo -e "\e[1;36m[🌐] NEW IP: \e[1;37m$NEW_IP\e[0m"
    echo -e "\e[1;35m[👤] PROVIDED BY: BIGBULL CHEATS\e[0m"
    echo -e "\e[1;33m[📞] SUPPORT: @bigbull8809\e[0m"
    echo ""
    
    # BIGBULL DELAY
    echo -e "\e[1;32m[⏳] BIGBULL: START GENERATING ACCOUNTS NOW...BY BBC GEN V12\e[0m"
    echo ""
    
    COUNT=$((COUNT + 1))
    sleep 5
done