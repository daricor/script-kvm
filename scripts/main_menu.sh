#!/bin/bash

. manage_vm/menu_vm.sh
. manage_snap/menu_snap.sh
. infoServ.sh

return()
{

	function_print_infoserv

	main_menu 

}


main_menu()
{

	clear

<<<<<<< HEAD
=======
	#function_print_infoserv

	#clear

	#echo -e "\nQue voulez vous effectuer  ?"
	#echo "1-Gestion des machines virtuelles"
	#echo -e "2-Gestion des sauvegardes des VM\n"
	#read choice

>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
	choice=$(whiptail --title "VM" --menu "Que voulez vous effectuer ?" 15 60 4 \
	"1" "Gestion des machines virtuelles" \
	"2" "Gestion des sauvegardes des VM" \
	"<-- Retour" "" 3>&1 1>&2 2>&3)
<<<<<<< HEAD
=======


>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15

	case $choice in
		"1") menu_vm ;;
		"2") menu_snap ;;
		"<-- Retour")  return;;
<<<<<<< HEAD
=======
		#*) echo "Entrée non autorisée";;
>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
	esac

}


<<<<<<< HEAD
=======

>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
function_print_infoserv

main_menu 
