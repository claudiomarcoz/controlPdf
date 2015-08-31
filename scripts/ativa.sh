#!/bin/bash

scriptPath="${PATH_A}/scripts/"
nop=$("${scriptPath}contarPaginas.sh" $arquivo)
prefixos="folha"

"${scriptPath}"divide.sh $prefixos $nop
cache="${PATH_A}/preCache"

echo -e "$($scriptPath"percorre.sh")"