#!/bin/bash



if [ -z "$1" ]
  then
    echo "Carpeta sense especificar com parametre"
    exit 1
fi



if ! [ -d  "/root/${1}" ]
	then
		echo "El directorio ${1} en /root/ no existeix!"
		echo "Vol crear el directori [s/n]?"
		read usuari_in
		case $usuari_in in
			s) mkdir /root/$1;;
			n) echo "Tancant programa" 
			exit 1;;
			*) echo "Opció desconeguda"
			exit 1;;
		esac
	fi
fecha=$(date +"%Y_%m_%d_%H_%M")
cp /etc/resolv.conf /root/$1/resolv.conf
cp /root/$1/resolv.conf /root/$1/resolv.conf.backup.$fecha
gzip /root/$1/resolv.conf.backup.$fecha
rm /root/$1/resolv.conf 
exit 0 
