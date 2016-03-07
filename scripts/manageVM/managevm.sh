#!/bin/bash

caseVM()
{

local choix

echo "------GESTION DES MACHINES VIRTUELLES------"

 echo "1-Arret d'une VM
2-Demarrer une VM
3-Lister les infos des VM
4-Créer une VM
5-Supprimer une VM
6-Plus
"
	
read choix

case $choix in
	"1") echo "arretVM";;
	"2") echo "demmarrerVM";;
	"3") echo "listerInfoVm";;
	"4") echo "creerVM";;
	"5") echo "suppriemrVM";;
	"6") echo "plus";;

	*) echo "Entrée non autorisée";;

esac





}