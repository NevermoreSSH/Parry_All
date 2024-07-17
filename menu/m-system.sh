#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m          • SYSTEM MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Panel Domain"
echo -e " [\e[36m•2\e[0m] Speedtest VPS"
echo -e " [\e[36m•3\e[0m] Set Auto Reboot"
echo -e " [\e[36m•4\e[0m] Restart All Service"
echo -e " [\e[36m•5\e[0m] Check Bandwith"
echo -e " [\e[36m•6\e[0m] Install TCP BBR"
echo -e " [\e[36m•7\e[0m] DNS Changer"
echo -e " [\e[36m•8\e[0m] Netflix Proxy"
echo -e " [\e[36m•9\e[0m] Xray-core Changer"
echo -e " [\e[36m•10\e[0m] Install WARP Cloudflare"
echo -e " [\e[36m•11\e[0m] Install SlowDNS"
echo -e " [\e[36m•12\e[0m] Install UDP Custom"
echo -e " [\e[36m•13\e[0m] Install SwapRAM"
echo -e " [\e[36m•14\e[0m] Install Helium by Abi Darwish"
echo -e " [\e[36m•15\e[0m] Panel Adblock(Helium)"
echo -e " [\e[36m•16\e[0m] Setup WARP Cloudflare"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; speedtest ; exit ;;
3) clear ; auto-reboot ; exit ;;
4) clear ; restart ; exit ;;
5) clear ; bw ; exit ;;
6) clear ; m-tcp ; exit ;;
7) clear ; dns ; exit ;;
8) clear ; netf ; exit ;;
9) clear ; wget -q -O /usr/bin/xraychanger "https://raw.githubusercontent.com/NevermoreSSH/Xcore-custompath/main/xraychanger.sh" && chmod +x /usr/bin/xraychanger && xraychanger ; exit ;;
10) clear ; setup2 ; exit ;;
11) clear ; wget https://raw.githubusercontent.com/NevermoreSSH/Vergil/main2/addons/dns2.sh && chmod +x dns2.sh && ./dns2.sh ; exit ;;
12) clear ; wget https://raw.githubusercontent.com/NevermoreSSH/Vergil/main/Tunnel/udp.sh && bash udp.sh ; exit ;;
13) clear ; wget -q -O /usr/bin/swapram "https://raw.githubusercontent.com/NevermoreSSH/swapram/main/swapram.sh" && chmod +x /usr/bin/swapram && swapram ; exit ;;
14) clear ; wget -q -O /usr/bin/helium https://raw.githubusercontent.com/NevermoreSSH/helium/main/helium.sh && chmod +x /usr/bin/helium && helium ; exit ;;
15) clear ; helium ; exit ;;
16) clear ; warp ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Wrong Button" ; sleep 1 ; m-system ;;
esac
