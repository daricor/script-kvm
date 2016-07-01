#!/bin/bash

list_vm() 
{

	liste_vm=`virsh list --all | awk '{print $2}' | sed '1,2d'`

	clear

	printf "%-5s| %-18s| %-10s| %-10s| %-14s| %-15s| %-10s| %-10s|\n" "Id" "Name" "State" "CPU" "Max_memory(kB)" "Used_memory(kB)" "Persistent" "Autostart" > /tmp/display.txt
	printf "___________________________________________________________________________________________________________\n" >> /tmp/display.txt
	for fichier in $liste_vm
	do
		test=$(virsh domstate $fichier | sed -n 1p)	

       		if [ "$test" == "running" ]	
       		then
			Id=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 1p)             
			Name=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 2p)          
			State=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 5p)
			CPU=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 6p)   
			Max_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 8p)    
			Used_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 9p)    
			Persistent=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 10p)     
			Autostart=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 11p)   
			printf "%-5s| %-18s| %-10s| %-10s| %-14s| %-15s| %-10s| %-10s\n" $Id $Name $State $CPU $Max_memory $Used_memory $Persistent $Autostart >> /tmp/display.txt
		else
			Id=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 1p)             
			Name=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 2p)          
			State=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 5p)
			CPU=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 6p)   
			Max_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 7p)    
			Used_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 8p)    
			Persistent=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 9p)     
			Autostart=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 10p)   
			printf "%-5s| %-18s| %-10s| %-10s| %-14s| %-15s| %-10s| %-10s\n" $Id $Name $State $CPU $Max_memory $Used_memory $Persistent $Autostart >> /tmp/display.txt
		fi
	done

	whiptail --title "VM" --msgbox "`cat /tmp/display.txt`" 20 115
	rm /tmp/display.txt

}

stop_vm_list() 
{

	liste_vm=`virsh list --state-running --state-paused --state-other | awk '{print $2}' | sed '1,2d'`

	clear

	printf "%-5s| %-18s| %-10s| %-10s| %-10s| %-11s| %-10s| %-10s|\n" "Id" "Name" "State" "CPU" "Max_memory" "Used_memory" "Persistent" "Autostart" > /tmp/display2.txt
	printf "__________________________________________________________________________________________________\n" >> /tmp/display2.txt
	for fichier in $liste_vm
	do
		test=$(virsh domstate $fichier | sed -n 1p)	

       		if [ "$test" == "running" ]	
       		then
			Id=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 1p)             
			Name=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 2p)          
			State=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 5p)
			CPU=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 6p)   
			Max_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 8p)    
			Used_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 9p)    
			Persistent=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 10p)     
			Autostart=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 11p)   
			printf "%-5s| %-18s| %-10s| %-10s| %-10s| %-11s| %-10s| %-10s\n" $Id $Name $State $CPU $Max_memory $Used_memory $Persistent $Autostart >>/tmp/display2.txt
		else
			Id=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 1p)             
			Name=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 2p)          
			State=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 5p)
			CPU=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 6p)   
			Max_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 7p)    
			Used_memory=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1 }' | sed -n 8p)    
			Persistent=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 9p)     
			Autostart=$(virsh dominfo $fichier | awk -F':' '{ print $2 }' | awk -F" " '{ print $1,$2 }' | sed -n 10p)   
			printf "%-5s| %-18s| %-10s| %-10s| %-10s| %-11s| %-10s| %-10s\n" $Id $Name $State $CPU $Max_memory $Used_memory $Persistent $Autostart >> /tmp/display2.txt
		fi
	done

	whiptail --title "VM" --msgbox "`cat /tmp/display2.txt`" 20 115
	rm /tmp/display2.txt

}

