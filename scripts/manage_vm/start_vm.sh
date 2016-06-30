#!/bin/bash


function_start_vm()
{

	local vm_state

	local result=$(virsh list --all --state-shutoff --state-paused --state-other --inactive | sed -n 3p)  # check if there is runnning vm or not

	if [ -z "$result" ]
	then
		echo "Aucune VM est à l'arret"
	else 
		virsh list --all --state-shutoff --state-paused --state-other --inactive
		echo "Veuillez saisir l'id ou le nom de la machine à démarrer"
		read id 
  
		vm_state=$(virsh domstate $id)  # get back vm state

		case $vm_state in
  			"paused") virsh resume $id ;;
			* ) virsh start $id	;;
		esac

	fi

}


start_vm()
{

	clear

	function_start_vm

	while [[ $? -ne 0 ]]
	do
		function_start_vm
	done

}
