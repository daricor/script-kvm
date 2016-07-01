#!/bin/sh

delete_snap()
{
	select_vm

	clear

	list_snap_print

	snap_name=$(whiptail --title "VM" --inputbox "Saisir le nom de la sauvegarde à supprimer" 10 60 3>&1 1>&2 2>&3)

        if [ $? -ne 0 ]
        then
                exit
        fi

        virsh snapshot-delete "$vm_choice" "$snap_name"

	if [ $? -eq 0 ]
	then
		whiptail --title "VM" --msgbox "La suppression s'est effectué avec succès" 8 50
		menu_snap
	else
		whiptail --title "VM" --msgbox "ERREUR !!!" 8 5
		menu_snap
	fi

}
