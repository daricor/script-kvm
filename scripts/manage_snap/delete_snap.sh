#!/bin/sh

delete_snap()
{
	select_vm

	clear

	list_snap_cmd

	echo "Saisir le nom de la sauvegarde à supprimer :"
        read snap_name
	
        virsh snapshot-delete "$vm_choice" "$snap_name"

	echo "Quelle action voulez-vous effectuer ?"
	echo "1-Revenir au menu principal"
	echo "2-Revenir au menu de gestion des sauvegardes"
	echo -e "3-Relancer le menu de suppression de sauvegardes\n"
	read choice

	case $choice in
        	"1") main_menu ;;
        	"2") menu_snap ;;
 		"3") delete_snap ;;
           	*) echo "Entrée non autorisée";;
	esac


}
