#!/bin/bash




arretVM(){

virsh list  --state-running --state-paused --state-other


id=$(virsh list  --state-running --state-paused --state-other | awk '{print $1}')


echo $id


}