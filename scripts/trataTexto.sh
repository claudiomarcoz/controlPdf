#!/bin/bash

parseravel="${1}"
tolerancia="${3}"
dirTrat="${2}"
flag_converte=False
fator=160
fatia=""
tamFatia=0
contaTamanho=trataImagem="${PATH_A}/scripts/""tamanhoGeral.sh"

function converte(){
local converte_prog="pdf2ps"
local dirTrat=${2}
local tmp_conv="$(echo "${1}" | rev |  cut -d"/" -f1 | rev )""_tmp.ps"
local tmp_comandflag=$( $converte_prog ${1} ${dirTrat}${tmp_conv} 2>/dev/null ;  if [ $? -gt 0 ]; then echo False; else echo True; fi; )
return $(if [ $tmp_comandflag == False ]; then echo False ; elif [ -f ${dirTrat}${tmp_conv} ]; then echo ${dirTrat}${tmp_conv}; else echo False; fi;)

}

function reconverte(){
local resolution=${2}	
local converte_prog="ps2pdf -dPDFSETTINGS=/screen -dDownsampleColorImages=true -dColorImageResolution="
local comple_prog=" -dColorImageDownsampleType=/Bicubic "
local arquitemp="${1}"
local arquiDest=${arquitemp}"_acer.pdf"
local comando=$( ${converte_prog}${resolution}${comple_prog}${arquitemp}" "${arquiDest} 2> /dev/null;  if [ $? -gt 0 ]; then echo False; else echo True; fi; )
local contador=0
local tmp_flag=$(if [ $comando == False ]; then echo False ; elif [ -f ${arquiDest} ]; then echo ${arquiDest}; else echo False; fi;)
while [ $tmp_flag == False ] || [ "$tmp_flag" == "" ]; do 
tmp_flag=$(if [ $comando == False ]; then echo False ; elif [ -f ${arquiDest} ]; then echo ${arquiDest}; else echo False; fi;)
if [ $contador -gt 5 ]; then echo False; exit 1; fi
contador=$(( $contador + 1 ))
done
return ${arquiDest}
}

while [ $flag_converte == False ] || [ "$flag_converte" == "" ]; do
if [ $contador -gt 5 ]; then
	echo False;
	exit 1;
fi
flag_converte=$( converte "$parseravel" "$dirTrat" )
contador=$(( $contador + 1 ))
done

for i in {1..20}; 
do
fatia="$( $reconverte $flag_converte $fator )"
tamFatia="$($contaTamanho $fatia)"	
	if [ $tamFatia -gt $tolerancia ] && [ $tolerancia -gt 10 ]; then
		fator=$(( $fator - $(( $i * 10 )) ))		
	else
	mv $parseravel "${PATH_A}/cache/"
	echo True;
	exit 0;
	fi


done