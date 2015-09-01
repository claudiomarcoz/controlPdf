#!/bin/bash

cache="${PATH_A}/preCache/*"
dir="preCache"
arq_trata=("${PATH_A}/preCache/.emtratamento" "${PATH_A}/preCache/.emcache")
log_geral="${PATH_A}/controle/.config"
scriptPath="${PATH_A}/scripts/""tamanhoGeral.sh"
dirTrata="${PATH_A}/trataImagem/"
dircache="${PATH_A}/cache/"
flag_feito=False

limite=191

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
		echo $dirTrata"$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )" >> ${arq_trata[0]}
		mv ${folha} $dirTrata
		echo "tratamento: ""$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )" >> ${log_geral}
		
else
		mv ${folha} $dircache
		echo $dircache"$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )"  >> ${arq_trata[1]}
		echo "juncao: ""$(echo "${folha}" | rev |  cut -d"/" -f1 | rev )" >> ${log_geral}		
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