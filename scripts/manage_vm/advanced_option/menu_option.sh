#!/bin/bash

. manage_vm/advanced_option/cpu_modif.sh
. manage_vm/advanced_option/ram_modif.sh
. manage_vm/advanced_option/disk_modif.sh

menu_option()
{

	clear

	local choice

	echo "------GESTION DES RESSOURCES------"

	echo "1-Modification de CPU"
	echo "2-Modification de Memoire"
	echo "3-Ajout de Disques Supplémentaires"

	read choice
	
	case $choice in
		"1") cpu_modif ;;
		"2") ram_modif ;;
		"3") disk_modif ;;
		 *)  echo "Entrée non autorisée";;
	esac

}
