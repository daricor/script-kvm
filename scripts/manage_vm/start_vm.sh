#!/bin/bash


function_start_vm()
{

	local vm_state

	local result=$(virsh list --all --state-shutoff --state-paused --state-other --inactive | sed -n 3p)  # check if there is runnning vm or not

	if [ -z "$result" ]
	then
		echo "Aucune VM est à l'arret"
	else 
<<<<<<< HEAD
		whiptail --title "VM" --msgbox "`virsh list --all --state-shutoff --state-paused --state-other --inactive`" 15 58
		id=$(whiptail --inputbox "Veuillez saisir l'id ou le nom de la machine à démarrer" 8 78 --title "VM" 3>&1 1>&2 2>&3)
=======
		#virsh list --all --state-shutoff --state-paused --state-other --inactive
		whiptail --title "VM" --msgbox "`virsh list --all --state-shutoff --state-paused --state-other --inactive`" 15 58


		id=$(whiptail --inputbox "Veuillez saisir l'id ou le nom de la machine à démarrer" 8 78 --title "VM" 3>&1 1>&2 2>&3)
		#echo "Veuillez saisir l'id ou le nom de la machine à démarrer"
		#read id 
  
>>>>>>> ab4f8ee7c17d834c40358e4b3bf021962499ea15
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

	whiptail --title "VM" --msgbox "Machine démarrée avac succes" 15 58

	menu_vm


}
