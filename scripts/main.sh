#!/bin/bash

. manageVM/managevm.sh
. manageSaves/managesaves.sh


echo "Que voulez vous effectuer  ? 
I-Gestion des machines virtuelles
II-Gestion des sauvegardes des VM"
	
read choix

case $choix in
	"1") caseVM ;;
	"2") caseSave ;;
	*) echo "Entrée non autorisée";;

esac
