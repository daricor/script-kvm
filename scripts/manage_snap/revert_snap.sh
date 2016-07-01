#!/bin/sh

revert_snap()
{
	select_vm
	
	clear

	list_snap_print
	
	snap_name=$(whiptail --title "VM" --inputbox "Saisir le nom de la sauvegarde à restaurer" 10 60 3>&1 1>&2 2>&3)
        
	if [ $? -ne 0 ]
        then
                exit
        fi

	virsh snapshot-revert $vm_choice $snap_name
	
	if [ $? -eq 0 ]
	then
		whiptail --title "VM" --msgbox "La restauration s'est effectué avec succès" 8 50
		menu_snap
	else
		whiptail --title "VM" --msgbox "ERREUR !!!" 8 5
		menu_snap
	fi

}


