#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
trws=$(grep -c -E "^#! $user" "/etc/xray/config.json" | awk '{print $1/2}')
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
echo "Checking VPS"
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m      • TROJAN MENU •              \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " Total Trojan User : ${green}$trws "
echo -e ""
echo -e " [\e[36m•1\e[0m] Create Account Trojan "
echo -e " [\e[36m•2\e[0m] Trial Account Trojan "
echo -e " [\e[36m•3\e[0m] Extending Account Trojan "
echo -e " [\e[36m•4\e[0m] Delete Account Trojan "
echo -e " [\e[36m•5\e[0m] Check User Login Trojan "
echo -e " [\e[36m•6\e[0m] User list created Account "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; user-tr ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Wrong button" ; sleep 1 ; m-trojan ;;
esac
