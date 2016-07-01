#!/bin/sh


create_snap()
{
	select_vm
	
	clear

	snap_name=$(whiptail --title "VM" --inputbox "Saisir le nom de votre sauvegarde" 10 60 3>&1 1>&2 2>&3)
        
	if [ $? -ne 0 ]
        then
                exit
        fi

       	virsh snapshot-create-as "$vm_choice" "$snap_name"
	
	if [ $? -eq 0 ]
    	then
        	whiptail --title "VM" --msgbox "Snapshot $snap_name créée" 8 50
        	menu_snap
    	else
	        whiptail --title "VM" --msgbox "ERREUR" 8 50
        	menu_snap
   	fi

}


