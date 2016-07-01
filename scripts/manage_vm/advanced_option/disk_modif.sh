#!/bin/bash

disk_modif()
{
	select_vm

        vm_disk_name=$(whiptail --title "VM" --inputbox "Saisir le nom du disque à ajouter" 10 60 3>&1 1>&2 2>&3)

        if [ $? -ne 0 ]
        then
                exit
        fi

        vm_disk_size=$(whiptail --title "VM" --inputbox "Saisir la taille du disque à ajouter (en Mo)" 10 60 3>&1 1>&2 2>&3)

        if [ $? -ne 0 ]
        then
                exit
        fi

        qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/${vm_disk_name}.qcow2 ${vm_disk_size}M
        virsh attach-disk --subdriver qcow2 --persistent $vm_choice /var/lib/libvirt/images/${vm_disk_name}.qcow2 vdc

        if [ $? -eq 0 ]
        then
                whiptail --title "VM" --msgbox "Ajout réussi" 8 50
                menu_option
        else
                virsh attach-disk --subdriver qcow2 --persistent $vm_choice /var/lib/libvirt/images/${vm_disk_name}.qcow2 vdd
                whiptail --title "VM" --msgbox "Ajout réussi" 8 50
                menu_option
        fi 

}
