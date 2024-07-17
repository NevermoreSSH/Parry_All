#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m            SSH Account            \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
nsdomain1=$(cat /root/nsdomain)
pubkey1=$(cat /etc/slowdns/server.pub)

sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "\E[0;41;36m            SSH Account            \E[0m" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Username    : $Login" | tee -a /etc/log-create-ssh.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-ssh.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "IP          : $IP" | tee -a /etc/log-create-ssh.log
echo -e "Host        : $domen" | tee -a /etc/log-create-ssh.log
echo -e "NS Host     : $nsdomain1" | tee -a /etc/log-create-ssh.log
echo -e "Pubkey      : $pubkey1" | tee -a /etc/log-create-ssh.log
echo -e "OpenSSH     : $opensh" | tee -a /etc/log-create-ssh.log
echo -e "Dropbear    : 143, 109" | tee -a /etc/log-create-ssh.log
echo -e "SlowDNS     : 22,80,443,53,5300" | tee -a /etc/log-create-ssh.log
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-ssh.log
echo -e "SSH WS      : $portsshws" | tee -a /etc/log-create-ssh.log
echo -e "SSH SSL WS  : $wsssl" | tee -a /etc/log-create-ssh.log
echo -e "SSL/TLS     :$ssl" | tee -a /etc/log-create-ssh.log
echo -e "UDPGW       : 7100-7900" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Payload WSS" | tee -a /etc/log-create-ssh.log
echo -e "
GET wss://bug.com HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Payload WS" | tee -a /etc/log-create-ssh.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "CONFIG SSH WS" | tee -a /etc/log-create-ssh.log
echo -e "SSH 80      : $domen:80@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "SSH 443     : $domen:443@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "SSH 1-65535 : $domen:1-65535@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
else

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "\E[0;41;36m            SSH Account            \E[0m" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Username    : $Login" | tee -a /etc/log-create-ssh.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-ssh.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "IP          : $IP" | tee -a /etc/log-create-ssh.log
echo -e "Host        : $domen" | tee -a /etc/log-create-ssh.log
echo -e "NS Host     : $nsdomain1" | tee -a /etc/log-create-ssh.log
echo -e "Pubkey      : $pubkey1" | tee -a /etc/log-create-ssh.log
echo -e "OpenSSH     : $opensh" | tee -a /etc/log-create-ssh.log
echo -e "Dropbear    : 143, 109" | tee -a /etc/log-create-ssh.log
echo -e "SlowDNS     : 22,80,443,53,5300" | tee -a /etc/log-create-ssh.log
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-ssh.log
echo -e "SSH WS      : $portsshws" | tee -a /etc/log-create-ssh.log
echo -e "SSH SSL WS  : $wsssl" | tee -a /etc/log-create-ssh.log
echo -e "SSL/TLS     :$ssl" | tee -a /etc/log-create-ssh.log
echo -e "UDPGW       : 7100-7900" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Payload WSS" | tee -a /etc/log-create-ssh.log
echo -e "
GET wss://bug.com HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "Payload WS" | tee -a /etc/log-create-ssh.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
echo -e "CONFIG SSH WS" | tee -a /etc/log-create-ssh.log
echo -e "SSH 80      : $domen:80@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "SSH 443     : $domen:443@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "SSH 1-65535 : $domen:1-65535@$Login:$Pass" | tee -a /etc/log-create-ssh.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-ssh.log
fi
echo "" | tee -a /etc/log-create-ssh.log
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
