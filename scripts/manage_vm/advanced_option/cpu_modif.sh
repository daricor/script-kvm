#!/bin/bash

cpu_modif()
{
        select_vm

        echo -e "\nSaisir le nombre de CPU à allouer à la VM :"
        read vm_cpu

        virsh setvcpus --count $vm_cpu $vm_choice --config

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


}

