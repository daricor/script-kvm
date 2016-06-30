#!/bin/bash

. manage_vm/stop_vm.sh
. manage_vm/select_vm.sh
. manage_vm/delete_vm.sh
. manage_vm/create_vm.sh
. manage_vm/start_vm.sh
. manage_vm/list_vm.sh
. manage_vm/plus_option.sh

menu_vm()
{

	clear

	local choice

	echo "------GESTION DES MACHINES VIRTUELLES------"

	echo "1-Arret d'une VM"
	echo "2-Demarrer une VM"
	echo "3-Lister les infos des VM"
	echo "4-Créer une VM"
	echo "5-Supprimer une VM"
	echo "6-Plus"	
	read choice

	case $choice in
		"1") stop_vm ;;
		"2") start_vm ;;
		"3") list_vm ;;
		"4") create_vm ;;
		"5") delete_vm ;;
		"6") plus_option ;;

		*) echo "Entrée non autorisée";;

	esac

}
