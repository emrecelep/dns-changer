#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

function header {
echo -e "\e[1;34m

██████╗░███╗░░██╗░██████╗  ░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗██████╗░  ░░███╗░░░░░░█████╗░
██╔══██╗████╗░██║██╔════╝  ██╔══██╗██║░░██║██╔══██╗████╗░██║██╔════╝░██╔════╝██╔══██╗  ░████║░░░░░██╔══██╗
██║░░██║██╔██╗██║╚█████╗░  ██║░░╚═╝███████║███████║██╔██╗██║██║░░██╗░█████╗░░██████╔╝  ██╔██║░░░░░██║░░██║
██║░░██║██║╚████║░╚═══██╗  ██║░░██╗██╔══██║██╔══██║██║╚████║██║░░╚██╗██╔══╝░░██╔══██╗  ╚═╝██║░░░░░██║░░██║
██████╔╝██║░╚███║██████╔╝  ╚█████╔╝██║░░██║██║░░██║██║░╚███║╚██████╔╝███████╗██║░░██║  ███████╗██╗╚█████╔╝
╚═════╝░╚═╝░░╚══╝╚═════╝░  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚═╝  ╚══════╝╚═╝░╚════╝░
"
}
                 
function dns_changer {
	
	echo -e "\e[1;33m"
	echo "[1] Change DNS Address              [4] Show DNS List  "
	echo "[2] Add DNS Address                 [5] Create Shortcut"
	echo "[3] Change Permantet DNS Address    [Q] Exit           "                   
	
	echo -e "${ENDCOLOR}"
	read -p "dns-changer : " SELECTED
	
	if [ "$SELECTED" = "1" ]; then
		chattr -i /etc/resolv.conf
		clear
		
		echo -e "\e[1;33mYou can use google dns address as an example." 
		echo -e "${GREEN}"
		read -p "Enter DNS Address : " ENTER_DNS
		
		echo -e "${RED}Changing DNS Address..."
		sleep 5
		echo -e "${RED}OK!"
		echo
		echo -e "${GREEN}YOUR DNS ADDRESS HAS BEEN CHANGED."
		echo "nameserver" "$ENTER_DNS" > /etc/resolv.conf
		exit
		
		
		
		
	elif [ "$SELECTED" = "2" ]; then
		chattr -i /etc/resolv.conf
		clear
		
		echo -e "\e[1;33mYou can use google dns address as an example." 
		echo -e "${GREEN}"
		read -p "Enter DNS Address : " ENTER_DNS
		
		echo -e "${RED}Adding DNS Address..."
		sleep 5
		echo -e "${RED}OK!"
		echo
		echo -e "${GREEN}YOUR DNS ADDRESS HAS BEEN CHANGED."
		echo "nameserver" "$ENTER_DNS" >> /etc/resolv.conf
		exit
		
	elif [ "$SELECTED" = "3" ]; then
		chattr -i /etc/resolv.conf
		clear
		
		echo -e "\e[1;33mYou can use google dns address as an example." 
		echo -e "${GREEN}"
		read -p "Enter DNS Address : " ENTER_DNS
		
		echo -e "${RED}Permanently Changing DNS Address..."
		sleep 5
		echo -e "${RED}OK!"
		echo
		echo -e "${GREEN}YOUR DNS ADDRESS HAS BEEN CHANGED."
		echo "nameserver" "$ENTER_DNS" > /etc/resolv.conf
		chattr +i /etc/resolv.conf
		exit
		
	elif [ "$SELECTED" = "4" ]; then
		clear
		cat dns_list
		echo -e "\e[1;33mhttps://www.softwaretestinghelp.com/best-dns-servers/"
		echo
		echo -e "${RED}Press 'Enter' for homepage"
		read
		header
		dns_changer
		
	elif [ "$SELECTED" = "5" ]; then
		clear
		if [ -f /usr/local/sbin/dnschanger ]; then
			echo -e "\e[1;31m"
			echo "Shortcut already exists!"
			sleep 3
			clear
					
			
		else		
			echo -e "\e[1;32m"
			echo "Do you want to create a shortcut for dnschanger in your system"
			echo "so you can run dnschanger from anywhere in your terminal?"
			echo ""

			echo -ne "$YELLOW""Choose y/n : "
			read -r cho
			
			case "$cho" in
				y|Y|Yes|yes|YES)
				echo -e "$YELLOW""Creating a shortcut..."
				sleep 4
				cp dns.sh /usr/local/sbin
				cp dns_list /usr/local/sbin
				mv /usr/local/sbin/dns.sh /usr/local/sbin/dnschanger
				chmod +x /usr/local/sbin/dnschanger;;
				
				n|N|No|no|NO)
				clear
				header
				dns_changer
			esac	
		fi
		clear
		header
		dns_changer	
		
		
	elif [ "$SELECTED" = "Q" ] || [ "$SELECTED" = "q" ]; then
		sleep 2
		exit
	else
		clear
		echo -e "\e[1;31mERROR : Press 'Enter' for homepage"
		read
		header
		dns_changer
	fi	
}

clear
header
dns_changer
		
	
	
