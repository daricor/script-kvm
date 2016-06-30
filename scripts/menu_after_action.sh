#!/bin/sh

menu_after_action()
{
	#SCRIPT_PATH="${BASH_SOURCE[0]}";
        #echo $SCRIPT_PATH | awk -F/ '{ print $NF }'

	echo "Quelle action voulez-vous effectuer ?"
        echo "1-Revenir au menu principal"
        echo "2-Revenir au menu de gestion des sauvegardes"
        echo -e "3-Revenir à la même action\n"
        read choice

        case $choice in
        "1") ./main.sh ;;
        "2") case_snap ;;
        "3") list_snap ;;
         *) echo "Entrée non autorisée";;

        esac

}
