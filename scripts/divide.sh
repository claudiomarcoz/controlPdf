#!/bin/bash

cache="${PATH_A}/preCache"
prefixo="$1"
nop="$2"
fnumero="%0"$(( $(echo "$nop" | wc -c ) - 1 ))"g"
for folha in $(seq -f $fnumero 1 "$nop");
do
pdftk A=$arquivo cat A${folha}-${folha} output ${cache}/${prefixo}_${folha}.pdf     
done;
