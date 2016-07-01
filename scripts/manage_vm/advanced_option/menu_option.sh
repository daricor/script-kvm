#!/bin/bash

. manage_vm/advanced_option/cpu_modif.sh
. manage_vm/advanced_option/ram_modif.sh
. manage_vm/advanced_option/disk_modif.sh

menu_option()
{

	clear

<<<<<<< HEAD
	choice=$(whiptail --title "VM" --menu "GESTION DES RESSOURCES" 15 60 7 \
	"1" "Modification de CPU" \
	"2" "Modification de Memoire" \
	"3" "Ajout de Disques Supplémentaires" \
	"<-- Retour" "" 3>&1 1>&2 2>&3)
=======
	local choice

	echo "------GESTION DES RESSOURCES------"

	echo "1-Modification de CPU"
	echo "2-Modification de Memoire"
	echo "3-Ajout de Disques Supplémentaires"

	read choice
>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
	
	case $choice in
		"1") cpu_modif ;;
		"2") ram_modif ;;
		"3") disk_modif ;;
<<<<<<< HEAD
		"<-- Retour") menu_vm ;;
=======
		 *)  echo "Entrée non autorisée";;
>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
	esac

}
