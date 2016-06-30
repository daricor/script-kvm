#!/bin/bash


secure_password()
{

	echo "Veuillez choisir votre mot de passe :"
	password=$(whiptail --title "Mot de passe" --passwordbox "Veuillez choisir votre mot de passe." 10 60 3>&1 1>&2 2>&3)
	if [ $? -ne 0 ] 
	then
        	exit
	fi

	password2=$(whiptail --title "Mot de passe" --passwordbox "Confirmez votre mot de passe." 10 60 3>&1 1>&2 2>&3)
	if [ $? -ne 0 ]
	then
		exit
	fi

	until [ "$password" == "$password2" ]
	do
		echo -e "Erreur !! Réessayer !\n"
		echo "Veuillez choisir votre mot de passe :"
        	read -s password
        	
		echo "Confirmez votre mot de passe :"
        	read -s password2
	done

}

secure_cpu_number()
{

	echo "Nombres de CPU alloué :"
	read cpu_number

	until [ $cpu_number -lt 4 ]
	do
		echo -e "Votre nombre de cpu(s) alloué(s) est supérieur a 4.\n"
        	echo "Veuillez réessayer :"
        	read  cpu_number
	done

}

secure_vm_name()
{

	echo "Donner un nom à la nouvelle VM :" 
	read vm_name
	
	letter_count=$(echo "$vm_name" | wc -m)

}



create_vm()
{

	let soustraction

	secure_vm_name
     	secure_password

	echo "Taille du disque (Mo) :"
	read disk_size

	secure_cpu_number

	echo "Taille mémoire (Mo) :"
	read memory_size
     
	{

    		virt-clone --original debian-tp1 --name "$vm_name" --file /var/lib/libvirt/images/$vm_name.qcow2
    		echo 25
    		virt-customize -d $vm_name  --root-password password:$password
		echo 50

		virt-customize --hostname $vm_name -d $vm_name
    		echo 60

    		if [ $disk_size -gt 10000 ]
		then
	
	   		soustraction=$(($disk_size-10000))
	   		echo $soustraction

	   		qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/$vm_name.qcow2 $(($soustraction))M
        		echo 63

	   		virsh attach-disk --subdriver qcow2 --persistent $vm_name /var/lib/libvirt/images/${vm_name}dd.qcow2 vdb
        		echo 75

		fi
	
		virsh start $vm_name
		virsh setvcpus --count $cpu_number $vm_name --config
    		echo 80

		virsh destroy $vm_name
    		echo 95
	
		virsh setmaxmem $vm_name $(($memory_size))M --config
    		echo 100


	} | whiptail --gauge "Veuillez patienter pendant la création de votre vm..." 6 60 0 

}

