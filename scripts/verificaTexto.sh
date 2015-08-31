#!/bin/bash

scriptPath="${PATH_A}/scripts/"
arq_path=${PATH_A}/$1
apend='/ProcSet \[/PDF'
texto='/Text'
image='/Image'
echo "$( if [ $( strings $arq_path | grep "$apend" 2> /dev/null | grep -o $texto 2> /dev/null | wc -c) -ge $( echo $texto | wc -c ) ]; then echo True; else echo False; fi; )" "$( if [ $( strings $arq_path | grep "$apend" 2> /dev/null | grep -o $image 2> /dev/null | wc -c) -ge $( echo $image | wc -c ) ]; then echo True; else echo False; fi; )"
