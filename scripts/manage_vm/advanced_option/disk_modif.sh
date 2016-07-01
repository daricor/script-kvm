#!/bin/bash

disk_modif()
{
	select_vm

	echo -e "\nSaisir le nom du disque à ajouter : "
	read vm_disk_name

	echo -e "\nSaisir la taille du disque à ajouter (en Mo) :\n "
	read vm_disk_size

        qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/${vm_disk_name}.qcow2 ${vm_disk_size}M
        virsh attach-disk --subdriver qcow2 --persistent $vm_choice /var/lib/libvirt/images/${vm_disk_name}.qcow2 vdb

        echo -e "\nQuelle action voulez-vous effectuer ?"
        echo "1-Revenir au menu principal"
        echo "2-Revenir au menu de gestion des VM"
        echo -e "3-Revenir au menu des options avancées\n"
        read choice

        case $choice in
                "1") main_menu  ;;
                "2") menu_vm ;;
                "3") menu_option ;;
                *) echo "Entrée non autorisée";;
        esac
}
