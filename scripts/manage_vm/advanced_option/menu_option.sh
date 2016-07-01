#!/bin/bash

. manage_vm/advanced_option/cpu_modif.sh
. manage_vm/advanced_option/ram_modif.sh
. manage_vm/advanced_option/disk_modif.sh

menu_option()
{

	clear

	choice=$(whiptail --title "VM" --menu "GESTION DES RESSOURCES" 15 60 7 \
	"1" "Modification de CPU" \
	"2" "Modification de Memoire" \
	"3" "Ajout de Disques Supplémentaires" \
	"<-- Retour" "" 3>&1 1>&2 2>&3)
	
	case $choice in
		"1") cpu_modif ;;
		"2") ram_modif ;;
		"3") disk_modif ;;
		"<-- Retour") menu_vm ;;
	esac

}
