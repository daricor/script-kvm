#!/bin/sh

list_snap_cmd()
{
	virsh snapshot-list "$vm_choice"
}


list_snap()
{
	select_vm
	
	clear

	result=$(list_snap_cmd | sed -n 3p)

	if [ -z "$result" ]
	then
		echo -e "Aucune sauvegarde n'existe pour cette VM.\n"
	else
		list_snap_cmd
	fi

	echo "Quelle action voulez-vous effectuer ?"
        echo "1-Revenir au menu principal"
        echo "2-Revenir au menu de gestion des sauvegardes"
        echo -e "3-Revenir au listing des sauvegardes\n"
	read choice

        case $choice in
	        "1") main_menu ;;
        	"2") menu_snap ;;
        	"3") list_snap ;;
		*) echo "Entrée non autorisée";;
        esac

}

