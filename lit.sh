#!/bin/bash
medir=0
frequencia=0
for item in $* ;
do 
if [ $( echo $item | wc -c ) -gt 1 ]; then 
medir=$(( $medir + $item ))
frequencia=$(( $frequencia + 1 ))
fi;
done; 
echo "$(( $medir / 1024 )) $frequencia"
