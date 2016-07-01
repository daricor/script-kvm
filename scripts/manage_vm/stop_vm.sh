#!/bin/bash

. manage_vm/list_vm.sh


function_stop_vm()
{

	result=$(virsh list  --state-running --state-paused --state-other | sed -n 3p)

	if [ -z "$result" ]
	then
		whiptail --title "VM" --msgbox "Aucune VM est en cours d'éxécution" 15 110
	else 
		stop_vm_list
		id=$(whiptail --title "VM" --inputbox "Veuillez saisir l'id de la machine à arreter" 10 60 3>&1 1>&2 2>&3)
		virsh shutdown $id

			if [ $? -eq 0 ]
			then
				whiptail --title "VM" --msgbox "Machine arrétée avec succes" 8 50
			fi
	fi

}

stop_vm()
{

	clear

	function_stop_vm

	while [[ $? -ne 0 ]]
	do
		whiptail --title "VM" --msgbox "Saisie incorrecte Veuillez réessayer" 8 50
		function_stop_vm
	done

	menu_vm

}


