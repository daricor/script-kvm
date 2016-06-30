#!/bin/bash

. manage_vm/list_vm.sh


function_stop_vm()
{

	result=$(virsh list  --state-running --state-paused --state-other | sed -n 3p)

	if [ -z "$result" ]
	then
		echo "Aucune VM est en cours d'éxécution"
	else 
		#virsh list  --state-running --state-paused --state-other
		stop_vm_list
		echo "Veuillez saisir l'id de la machine à arreter"
		read id   
		virsh shutdown $id
	fi

}

stop_vm()
{

	clear

	function_stop_vm

	while [[ $? -ne 0 ]]; do
		function_stop_vm
	done
}


