#!/bin/bash

. manage_snap/create_snap.sh
. manage_snap/delete_snap.sh
. manage_snap/revert_snap.sh
. manage_snap/list_snap.sh
. manage_vm/select_vm.sh



menu_snap()
{

	clear

	#local choice

	#echo "------GESTION DES SAUVEGARDES------"
	#echo "1-Lister les snapshots d'une VM"
	#echo "2-Créer une snapshot"
	#echo "3-Restaurer une snapshot"
	#echo "4-Supprimer un snapshot"
	
	#read choice

	choice=$(whiptail --title "VM" --menu "GESTION DES SAUVEGARDES" 15 60 6 \
	"1" "Lister les snapshots d'une VM" \
	"2" "Créer une snapshot" \
	"3" "Restaurer une snapshot" \
	"4" "Supprimer un snapshot" \
	"<-- Retour" "" 3>&1 1>&2 2>&3)



	case $choice in
		"1") list_snap ;;
		"2") create_snap ;;
		"3") revert_snap ;;
		"4") delete_snap ;;
		"<-- Retour") main_menu ;;
		#*) echo "Entrée non autorisée";;
	esac

}
