#!/bin/bash

flag_image='/Subtype /Type'
flag_len='/Length [0-9]\+'
tipo=$(cat <<-_EOS_
/Subtype /Image
/Filter /DCTDecode
/Width [0-9]\+
/Height [0-9]\+
/Length [0-9]\+
_EOS_
)
contador=0
contadorGeral=0

# echo "$(strings $1 | grep   "${tipo}" )"
echo "$(strings $1)" | while read linha ; 
do
contadorGeral=$(( $contadorGeral + 1 ))
if [ $( echo "$linha" | grep "$flag_image" 2> /dev/null | wc -c ) -gt 1 ]; then 
contador=$contadorGeral
fi;

if [ $( echo "$linha" | grep "$flag_len" 2> /dev/null | wc -c ) -gt 1 ]; then

if [ $(( $contadorGeral - $contador )) -le 60 ] && [ $contador -ge 1 ]; then
echo $(( $( echo "$linha" | grep "$flag_len" 2> /dev/null | grep -o '[0-9]\+' 2> /dev/null ) / 1024 ))
contador=0
exit 0;
fi;

if [ $contador -ge 1 ] && [ $(( $contadorGeral - $contador )) -gt 60 ]; then
contador=0
fi;


fi;

done; 

# /Subtype /[A-Z]\+[A-Za-z]\+
