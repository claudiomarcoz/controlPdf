#!/bin/bash

dirTrataImg="${PATH_A}/trataImagem/"
dirTrataTxt="${PATH_A}/trataTexto/"
scriptPath="${PATH_A}/scripts/"
temTexto=False
temImagem=False
imagem=2
texto=1

original=$1
log_geral=$2
arquivo="$(echo "${original}" | rev |  cut -d"/" -f1 | rev )"
verificacao="$( ${scriptPath}"verificaTexto.sh" $original )"
temTexto=$( ${scriptPath}"array.sh" "$verificacao" $texto )
temImagem=$( ${scriptPath}"array.sh" "$verificacao" $imagem )
if [ $temTexto == True ]; then
	mv $original $dirTrataTxt
	echo "${dirTrataTxt}${arquivo}"
	echo "tratamento:texto:""${arquivo}" >> ${log_geral}
	exit 0
elif [ $temImagem == True ]; then
	mv $original $dirTrataImg
	echo "${dirTrataImg}${arquivo}"
	echo "tratamento:imagem:""${arquivo}" >> ${log_geral}
	exit 0
else 
	echo False
	exit 1
fi