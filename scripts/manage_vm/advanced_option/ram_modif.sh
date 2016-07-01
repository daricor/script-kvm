#!/bin/bash

ram_modif()
{
	select_vm

<<<<<<< HEAD
        vm_ram=$(whiptail --title "VM" --inputbox "Saisir la RAM totale voulu (en Mo)" 10 60 3>&1 1>&2 2>&3)
        if [ $? -ne 0 ]
        then
                exit
        fi

        virsh setmaxmem $vm_choice ${vm_ram}M --config

        answer=$(whiptail --title "VM" --inputbox "Afin que les modifications soient effectives, veuillez redémarrer la VM
        Voulez vous redémarrer la VM ? (oui/non)" 10 60 3>&1 1>&2 2>&3)

        if [ "$answer" = "oui" ]
        then
                full_name=$(whiptail --title "VM" --inputbox "Pour redémarrer la VM, veuillez saisir son nom" 10 60 3>&1 1>&2 2>&3)
                
                if [ $? -ne 0 ]
                then
                        exit
                fi

                virsh destroy $full_name
                virsh start $full_name

                if [ $? -eq 0 ]
                then
                        whiptail --title "VM" --msgbox "VM redémarrée" 8 50
                        menu_option
                else 
                        whiptail --title "VM" --msgbox "Erreur" 8 50
                        exit
                fi 

        elif [ "$answer" = "non" ]
        then
                whiptail --title "VM" --msgbox "Pensez à redémarrer la VM ultérieurement afin de mettre en place les modifications" 8 50

                menu_option
        else
                echo -e "\nErreur de saisie. Redémarrer la VM ultérieurement."

                menu_option
        fi

=======
	echo -e "\nSaisir la RAM totale voulu (en Mo) :"
	read vm_ram

        virsh setmaxmem $vm_choice ${vm_ram}M --config

	echo "Afin que les modifications soient effectives, veuillez redémarrer la VM."
        echo "Voulez vous redémarrer la VM ? (oui/non)"
        read answer

        if [ "$answer" = "oui" ]
        then
                echo -e "\nPour redémarrer la VM, veuillez saisir son nom :"
                read full_name

                virsh destroy $full_name
                virsh start $full_name
        elif [ "$answer" = "non" ]
        then
                echo "Pensez à redémarrer la VM ultérieurement afin de mettre en place les modifications."
        else
                echo -e "\nErreur de saisie. Redémarrer la VM ultérieurement."
        fi

	echo -e "\nQuelle action voulez-vous effectuer ?"
        echo "1-Revenir au menu principal"
        echo "2-Revenir au menu de gestion des VM"
        echo -e "3-Revenir au menu des options avancées\n"
        read choice

        case $choice in
                "1") main_menu  ;;
                "2") menu_vm ;;
                "3") menu_option ;;
                *) echo "Entrée non autorisée";;
        esac

>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15

}
