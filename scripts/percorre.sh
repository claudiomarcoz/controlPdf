#!/bin/bash

cache="${PATH_A}/preCache/*"
dir="preCache"
arq_trata="${PATH_A}/preCache/.emtratamento"
scriptPath="${PATH_A}/scripts/""tamanhoGeral.sh"
dirTrata="${PATH_A}/trataImagem/"
limite=191
rm $arq_trata
touch $arq_trata
for folha in $cache;
do

if [ "$( $scriptPath ${dir}/$( echo $folha | grep -o '[^/]\+_''[0-9]\+[.]pdf' ) )" -ge $limite ] ; 
	then
		echo "${folha}" >> $arq_trata
		mv ${folha} $dirTrata
fi
done;
