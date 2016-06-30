#!/bin/bash

. manage_vm/menu_vm.sh
. manage_snap/menu_snap.sh
. infoServ.sh

main_menu()
{

	clear

	function_print_infosev

	echo -e "\nQue voulez vous effectuer  ?"
	echo "1-Gestion des machines virtuelles"
	echo -e "2-Gestion des sauvegardes des VM\n"
	read choice

	case $choice in
		"1") menu_vm ;;
		"2") menu_snap ;;
		*) echo "Entrée non autorisée";;
	esac

}

main_menu 
