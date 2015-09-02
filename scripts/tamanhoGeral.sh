#!/bin/bash

scriptPath="${PATH_A}/scripts/"
if [ -f $1 ]; 
then 
	arq_path = $1
else
	arq_path=${PATH_A}/$1
fi

# echo $(ls -l $arq_path |  |grep -o '^[0-9]\+')
echo $(( $(ls -l  $arq_path  | cut -d" " -f 5) / 1024 ))
