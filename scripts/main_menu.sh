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

	choice=$(whiptail --title "VM" --menu "Que voulez vous effectuer ?" 15 60 4 \
	"1" "Gestion des machines virtuelles" \
	"2" "Gestion des sauvegardes des VM" \
	"<-- Retour" "" 3>&1 1>&2 2>&3)

	case $choice in
		"1") menu_vm ;;
		"2") menu_snap ;;
		"<-- Retour")  return;;
	esac

}


function_print_infoserv

main_menu 
