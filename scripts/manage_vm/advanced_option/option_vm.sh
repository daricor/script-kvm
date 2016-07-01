#!/bin/bash
. manage_vm/list_vm.sh

modif_cpu_VM()
{

	select_vm

	echo "Saisir le nombre de CPU à allouer à $vm_choice"
	read vm_cpu

#	virsh start $nom_vm

	virsh setvcpus --count $nombre_cpu $nom_vm --config
#	virsh destroy $nom_vm
	
}

modif_ram_VM()
{
 
	nom_vm=$1
	nombre_memoire=$2
	virsh destroy $nom_vm
	virsh setmaxmem $nom_vm ${nombre_memoire}M --config

}

modif_disque_VM()
{

	$1=nom_vm
	$2=nom_disk
	$3=taille_disque

	virsh destroy $nom_vm
	cd /var/lib/libvirt/images/
	qemu-img create -f raw ${nom_disk}.img ${taille_disque}M
	virsh attach-disk $nom_vm --source /var/lib/libvirt/images/${nom_disk}.img --target vdb --persistent

}
