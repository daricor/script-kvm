#!/bin/bash

{
echo 25
sleep 5
echo 35
sleep 5
echo 99
sleep 2
echo 100 
} | whiptail --gauge "Please wait while we are sleeping..." 6 50 0 

#whiptail --title "Titre  Message Box" --msgbox "Utilisation de whiptail pour la creation d'un messageBox. Cliquer sur Ok pour continuer." 10 60

