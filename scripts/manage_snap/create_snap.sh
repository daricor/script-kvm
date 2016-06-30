#!/bin/sh


create_snap()
{
	select_vm
	
	clear

	echo "Saisir le nom de votre sauvegarde :"
	read snap_name

       	virsh snapshot-create-as "$vm_choice" "$snap_name"
	
	echo -e "\nQuelle action voulez-vous effectuer ?"
        echo "1-Revenir au menu principal"
        echo "2-Revenir au menu de gestion des sauvegardes"
        echo -e "3-Revenir à la création des sauvegardes\n"
        read choice

        case $choice in
        	"1") main_menu  ;;
       		"2") menu_snap ;;
        	"3") create_snap ;;
         	*) echo "Entrée non autorisée";;
        esac


}


