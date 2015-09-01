#!/bin/bash

limite=$1
log_geral=$2
dirTrataImg="${PATH_A}/trataImagem/"
dirTrataTxt="${PATH_A}/trataTexto/"
percorre=$3
trataTexto="${PATH_A}/scripts/"trataTexto.js
trataImagem="${PATH_A}/scripts/"trataImagem.js
distintivo=""

cat "$percorre" | while read $item; 
do
	tipo=""
	arquivo=""
	distintivo="$(echo "${item}" | rev |  cut -d"/" -f1 | rev )"
	  IFS=' ';
	  read tratamento tipo arquivo<<<$(grep -e $distintivo $log_geral | tr ':' ' ');
	  if [ $tipo == "imagem" ] && [ $arquivo == $distintivo ]; then
	  	echo $($trataImagem $item $limite)
	  elif [ $tipo == "texto" ] && [ $arquivo == $distintivo ]; then
	  	echo $($trataTexto $item $limite)
	  else
	  	echo False
	  	exit 1
	  fi
done
