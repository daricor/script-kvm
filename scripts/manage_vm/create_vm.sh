#!/bin/bash


secure_password()
{

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
	        whiptail --title "VM" --msgbox "Les deux mots de passes doivent être identique" 15 110
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
	done

}

secure_cpu_number()
{

	cpu_number=$(whiptail --title "VM" --inputbox "Nombres de CPU alloué" 10 60 3>&1 1>&2 2>&3)
	
	if [ $? -ne 0 ]
	then
		exit
	fi

	until [ $cpu_number -le `lscpu | sed -n 4p | awk '{print $2}'` ]
	do
		whiptail --title "VM" --msgbox "Votre nombre de cpu(s) alloué(s) est supérieur a `lscpu | sed -n 4p | awk '{print $2}'`
		Veuillez réessayer" 8 50
 	      	cpu_number=$(whiptail --title "VM" --inputbox "Nombres de CPU alloué" 10 60 3>&1 1>&2 2>&3)

	       	if [ $? -ne 0 ]
		then
			exit
		fi
	done

}

secure_vm_name()
{

	vm_name=$(whiptail --title "VM" --inputbox "Donnez un nom à votre VM" 10 60 3>&1 1>&2 2>&3)

	if [ $? -ne 0 ]
	then
		exit
	fi
	
	letter_count=$(echo "$vm_name" | wc -m)

	while [ -z $vm_name ]
	do
		vm_name=$(whiptail --title "VM" --inputbox "Donnez un nom à votre VM" 10 60 3>&1 1>&2 2>&3)
	
		if [ $? -ne 0 ]
		then
			exit
		fi
	done

}

secure_memory_size()
{

	memory_size=$(whiptail --title "VM" --inputbox "Taille mémoire (Mo)" 10 60 3>&1 1>&2 2>&3)

	if [ $? -ne 0 ]
	then
		exit
	fi

	while [ -z $memory_size ]
	do
		memory_size=$(whiptail --title "VM" --inputbox "Taille mémoire (Mo)" 10 60 3>&1 1>&2 2>&3)

		if [ $? -ne 0 ]
		then
			exit
		fi
	done

}

secure_disk_size()
{

	disk_size=$(whiptail --title "VM" --inputbox "Taille du disque (Mo)" 10 60 3>&1 1>&2 2>&3)

	if [ $? -ne 0 ]
	then
		exit
	fi

	while [ -z $disk_size ]
	do
		disk_size=$(whiptail --title "VM" --inputbox "Taille du disque (Mo)" 10 60 3>&1 1>&2 2>&3)

		if [ $? -ne 0 ]
		then
			exit
		fi
	done

}

create_vm()
{

	let soustraction
	secure_vm_name
	secure_password
	secure_disk_size	
	secure_cpu_number
	secure_memory_size

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

	   		qemu-img create -f qcow2 -o preallocation=metadata /var/lib/libvirt/images/${vm_name}2.qcow2 $(($soustraction))M
        		echo 63

	   		virsh attach-disk --subdriver qcow2 --persistent $vm_name /var/lib/libvirt/images/${vm_name}2.qcow2 vdb
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

	whiptail --title "VM" --msgbox "VM créée avec succes" 8 50

	menu_vm

}

