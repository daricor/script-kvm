#!/bin/bash

. manage_vm/select_vm.sh

delete_vm()
{

        select_vm
	
        answer=$(whiptail --title "Input" --inputbox "Etes-vous sûr de vouloir supprimer cette VM : $vm_choice  ? (oui/non)" 10 60 3>&1 1>&2 2>&3)
       
        if [ $? -ne 0 ]
        then
                exit
        fi

	if [ "$answer" = "oui" ]
        then
                virsh destroy $vm_choice 2> /dev/null
                virsh undefine $vm_choice 2> /dev/null

                if [ -e /var/lib/libvirt/images/${vm_choice}.qcow2 ]
                then
<<<<<<< HEAD
=======
                       
>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
                        rm /var/lib/libvirt/images/${vm_choice}* 2> /dev/null
                fi 

                whiptail --title "VM" --msgbox "$vm_choice supprimée avec succes" 8 50
               
		menu_vm
        elif [ "$answer" = "non" ]
        then
		whiptail --title "VM" --msgbox "Suppression annulée" 8 50
 
		menu_vm
        else
        	echo -e "\nErreur de saisie. Rechargement du script en cours...\n"
		sleep 3

                delete_vm
        fi

}

