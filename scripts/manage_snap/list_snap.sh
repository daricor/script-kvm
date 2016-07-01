#!/bin/sh

list_snap_cmd()
{
	virsh snapshot-list "$vm_choice"
}

list_snap_print()
{
	whiptail --title "VM" --msgbox "`list_snap_cmd`" 20 90
}


list_snap()
{
	select_vm
	
	clear

	result=$(list_snap_cmd | sed -n 3p)

	if [ -z "$result" ]
	then
		whiptail --title "VM" --msgbox "Aucune sauvegarde n'existe pour cette VM" 8 50
		menu_snap
	else
		whiptail --title "VM" --msgbox "`list_snap_cmd`" 20 90
		menu_snap
	fi

}

