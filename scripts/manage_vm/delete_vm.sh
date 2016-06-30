#!/bin/bash

. manage_vm/select_vm.sh

delete_vm()
{

        select_vm
        
	echo -e "\nEtes-vous sûr de vouloir supprimer cette VM :" $vm_choice " ? (oui/non)\n"
        read answer
	
	if [ "$answer" = "oui" ]
        then
        	echo -e "\n" $vm_choice "supprimé"
                virsh destroy $vm_choice 2> /dev/null
                virsh undefine $vm_choice 2> /dev/null

                if [ -e /var/lib/libvirt/images/${vm_choice} ]
                then
                        rm /var/lib/libvirt/images/${vm_choice}.qcow2
                        rm /var/lib/libvirt/images/${vm_choice}dd.qcow2 2> /dev/null
                fi 
                
        elif [ "$answer" = "non" ]
        then
                echo "Suppression annulée"
        else
        	echo -e "\nErreur de saisie. Rechargement du script en cours...\n"
		sleep 3
                delete_vm
        fi

}

