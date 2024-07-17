#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)";
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
# CARI APA
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m       • SSH MENU •                \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " Total SSH User : ${green}$total_ssh "
echo -e ""
echo -e " [\e[36m•1\e[0m] Create SSH & WS Account "
echo -e " [\e[36m•2\e[0m] Trial SSH & WS Account "
echo -e " [\e[36m•3\e[0m] Renew SSH & WS Account "
echo -e " [\e[36m•4\e[0m] Delete SSH & WS Account "
echo -e " [\e[36m•5\e[0m] Check User Login SSH & WS "
echo -e " [\e[36m•6\e[0m] List Member SSH & WS "
echo -e " [\e[36m•7\e[0m] Delete User Expired SSH & WS "
echo -e " [\e[36m•8\e[0m] Set up Autokill SSH "
echo -e " [\e[36m•9\e[0m] Cek Users Who Do Multi Login Multi"
echo -e " [\e[36m•10\e[0m] User list created Account "
echo -e " [\e[36m•11\e[0m] Change Banner SSH "
echo -e " [\e[36m•12\e[0m] Set Lock User "
echo -e " [\e[36m•13\e[0m] Set Unlock User "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
10) clear ; cat /etc/log-create-ssh.log ; exit ;;
11) clear ; nano /etc/issue.net ; exit ;;
12) clear ; user-lock ; exit ;;
13) clear ; user-unlock ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Wrong button " ; sleep 1 ; m-sshovpn ;;
esac
