#!/bin/bash

scriptPath="${PATH_A}/scripts/"
nop=$("${scriptPath}contarPaginas.sh" $arquivo)
prefixos="folha"
"${scriptPath}"divide.sh $prefixos $nop


echo $nop
