#!/bin/bash

. manage_snap/create_snap.sh
. manage_snap/delete_snap.sh
. manage_snap/revert_snap.sh
. manage_snap/list_snap.sh
. manage_vm/select_vm.sh

menu_snap()
{

	clear

	local choice

	echo "------GESTION DES SAUVEGARDES------"
	echo "1-Lister les snapshots d'une VM"
	echo "2-Créer une snapshot"
	echo "3-Restaurer une snapshot"
	echo "4-Supprimer un snapshot"
	
	read choice

	case $choice in
		"1") list_snap ;;
		"2") create_snap ;;
		"3") revert_snap ;;
		"4") delete_snap ;;
		*) echo "Entrée non autorisée";;
	esac

}
