#!/bin/bash

scriptPath="${PATH_A}/scripts/"
arq_path=${PATH_A}/$1

# echo $(ls -l $arq_path |  |grep -o '^[0-9]\+')
echo $(( $(ls -l  $arq_path  | cut -d" " -f 5) / 1024 ))
