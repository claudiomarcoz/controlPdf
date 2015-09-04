#!/bin/bash

scriptPath="${PATH_A}/scripts/"

if [ $( echo "$1" | wc -c ) -le 1 ] ;
	then
	echo "0"
	exit 1
fi

if [ -f $1 ]; 
then 
	arq_path=$1
	echo $(( $(ls -l  $arq_path  | cut -d" " -f 5) / 1024 ))
elif [ -f ${PATH_A}/$1 ] && [ $( echo "$1" | wc -c ) -gt 1 ];
then
	arq_path=${PATH_A}/$1
	echo $(( $(ls -l  $arq_path  | cut -d" " -f 5) / 1024 ))
fi



# echo $(ls -l $arq_path |  |grep -o '^[0-9]\+')