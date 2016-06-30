#!/bin/sh

revert_snap()
{
	select_vm
	
	clear

	list_snap_cmd
	
	echo "Saisir le nom de la sauvegarde à restaurer :"
	read snap_name
        
	virsh snapshot-revert $vm_choice $snap_name
	
	if [ "$?" -eq "0" ]
	then
		echo -e "La restauration s'est effectué avec succès.\n"
	fi

	echo "Quelle action voulez-vous effectuer ?"
        echo "1-Revenir au menu principal"
        echo "2-Revenir au menu de gestion des sauvegardes"
        echo -e "3-Relancer le menu de restauration de sauvegardes\n"
        read choice

        case $choice in
                "1") main_menu ;;
                "2") menu_snap ;;
                "3") revert_snap ;;
                *) echo "Entrée non autorisée";;
        esac

}


