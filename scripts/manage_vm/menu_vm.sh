#!/bin/bash

. manage_vm/stop_vm.sh
. manage_vm/select_vm.sh
. manage_vm/delete_vm.sh
. manage_vm/create_vm.sh
. manage_vm/start_vm.sh
. manage_vm/list_vm.sh
. manage_vm/advanced_option/menu_option.sh


menu_vm()
{

	clear

<<<<<<< HEAD
=======
	#local choice

	#echo "------GESTION DES MACHINES VIRTUELLES------"

	#echo "1-Arret d'une VM"
	#echo "2-Demarrer une VM"
	#echo "3-Lister les infos des VM"
	#echo "4-Créer une VM"
	#echo "5-Supprimer une VM"
	#echo "6-Plus"	
	#read choice

>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
	choice=$(whiptail --title "VM" --menu "GESTION DES MACHINES VIRTUELLES" 15 60 7 \
	"1" "Arret d'une VM" \
	"2" "Demarrer une VM" \
	"3" "Lister les infos des VM" \
	"4" "Créer une VM" \
	"5" "Supprimer une VM" \
	"6" "Plus" \
	"<-- Retour" "" 3>&1 1>&2 2>&3)
<<<<<<< HEAD
=======

>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15

	case $choice in
		"1") stop_vm ;;
		"2") start_vm ;;
		"3") list_vm 
		     menu_vm ;;
		"4") create_vm ;;
		"5") delete_vm ;;
		"6") menu_option ;;
		"<-- Retour") main_menu ;;
<<<<<<< HEAD
=======

		#*) echo "Entrée non autorisée";;
>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15

	esac

}
