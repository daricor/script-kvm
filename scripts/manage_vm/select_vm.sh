#!/bin/bash

. manage_vm/list_vm.sh

vm_choice=''

select_vm()
{

	list_vm

	echo -e "\nVeuillez saisir la VM souhaitée :"
	read vm_choice
		 
}

