#!/bin/bash

cache="${PATH_A}/preCache/*"
dir="preCache"
arq_trata=("${PATH_A}/controle/.emtratamento" "${PATH_A}/controle/.emcache")
log_geral=$2
scriptPath="${PATH_A}/scripts/""tamanhoGeral.sh"

dircache="${PATH_A}/cache/"
flag_feito=False

limite=$1

if [ -f "$log_geral" ]; then
	rm $log_geral
	touch $log_geral
else
	touch $log_geral
fi

for item in ${arq_trata[@]};
do
	if [ -f $item ]; then
		rm $item
	fi
touch $item
done

for folha in $cache;
do

if [ "$( $scriptPath ${dir}/$( echo $folha | grep -o '[^/]\+_''[0-9]\+[.]pdf' ) )" -ge $limite ] ; 
	then
		direcionador=$("${PATH_A}/scripts/""direcionaTratamento.sh" "${folha}" "${log_geral}")
		if [ $direcionador == False ]; then
			echo False;
			exit 1
		else
			echo "$direcionador" >> ${arq_trata[0]}
		fi
		
		
else
		mv ${folha} $dircache
		echo $dircache"$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )"  >> ${arq_trata[1]}
		if [ "$( "${PATH_A}/scripts/""verificaTexto.sh" "${dircache}$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )" )" == "False True" ]; then
			echo "juncao:imagem:""$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )" >> ${log_geral}	
		else
			echo "juncao:texto:""$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )" >> ${log_geral}	
		fi
fi
done;

for item in ${arq_trata[@]};
do	
	if [ -f $item ]; then 
		cat $item | while read items;
		do

			if [ -f $items ]; then
				flag_feito=True				
			else
				echo False;				
				flag_feito=False
				exit 1;
			fi
		done;
	else	
		echo False ;		
		exit 1;
	fi; 
done
		echo True;