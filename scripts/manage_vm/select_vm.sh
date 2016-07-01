#!/bin/bash

. manage_vm/list_vm.sh

vm_choice=''

select_vm()
{

	list_vm
	
	vm_choice=$(whiptail --title "Input" --inputbox "Veuillez saisir la VM souhaitée" 10 60 3>&1 1>&2 2>&3)

	if [ $? -ne 0 ]
	then
        	exit
   	fi

	virsh dominfo $vm_choice

	if [ $? -ne 0 ]
	then
		whiptail --title "VM" --msgbox "Votre entrée n'existe pas" 8 50
	
		select_vm
	fi

}

