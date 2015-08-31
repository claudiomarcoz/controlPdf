#!/bin/bash

scriptPath="${PATH_A}/scripts/"
arq_path=${PATH_A}/$1
echo "$(strings $arq_path | grep Length | grep -o '[0-9]\+' | xargs ${scriptPath}sizeitem.sh)" 
