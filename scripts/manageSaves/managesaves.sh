#!/bin/bash

caseSave(){

local choix

echo "------GESTION DES SAUVEGARDES------
1-Lister les snapshots d'une VM
2-Créer une snapshot
3-Restaurer une snapshot
4-Supprimer un snapshot
"
	
read choix

case $choix in
	"1") echo "listerVM";;
	"2") echo "creerSnap";;
	"3") echo "restaurerVM";;
	"4") echo "supprimerSnap";;
	*) echo "Entrée non autorisée";;

esac





}