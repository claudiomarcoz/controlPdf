#!/bin/bash
export PATH_A="/var/projetos/controlPdf"
source ${PATH_A}/scripts/carrega.sh "parsear"
scriptPath="${PATH_A}/scripts/"
nop=$("${scriptPath}contarPaginas.sh" $arquivo)
prefixos="folha"
limite=27
log_geral="${PATH_A}/controle/.config"
arq_trata=("${PATH_A}/controle/.emtratamento" "${PATH_A}/controle/.emcache") # arq_trata esta duplicado no percorre pois é array


"${scriptPath}"divide.sh $prefixos $nop
cache="${PATH_A}/preCache"

echo -e "$($scriptPath"percorre.sh" $limite "$log_geral" )"
echo -e "$($scriptPath"percorreTratamento.sh" $limite "$log_geral" ${arq_trata[0]})"