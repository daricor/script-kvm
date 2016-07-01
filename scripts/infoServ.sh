#!/bin/bash

function_print_infoserv()
{

whiptail --title "Informations Serveur" --msgbox  "

`lsb_release -idrc`
Kernel:`uname -r`

CPU name:`cat /proc/cpuinfo | grep model | cut -c14- | sed -n 2p`
CPU core(s):`lscpu | sed -n 4p | awk '{print $2}'`

Free memory:`free -h | sed -n 3p | awk '{print $4}'`
Free mem disk:`df -h | grep /var | awk '{print $4}'`
" 20 60

}



