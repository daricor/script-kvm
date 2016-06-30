#!/bin/bash

. manage_vm/stop_vm.sh
. manage_vm/select_vm.sh
. manage_vm/delete_vm.sh
. manage_vm/create_vm.sh
. manage_vm/start_vm.sh
. manage_vm/list_vm.sh

plus_option()
{

	clear

	local choice

	echo "------GESTION DES RESSOURCES------"

	echo "1-Ajout de CPU"
	echo "2-Ajout de Memoire"
	echo "3-Ajout de Disques Supplémentaires"

	case $choice in
		"1") echo "add cpu" ;;
		"2") echo "add memory" ;;
		"3") echo "add disk" ;;
		 *)  echo "Entrée non autorisée";;

	esac

}
