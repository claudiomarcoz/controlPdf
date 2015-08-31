#!/bin/bash
echo $( if [ $(dpkg -S $1 | grep $(which $1) 2> /dev/null | wc -c ) -ge $(echo $1 | wc -c) ]; then echo "1"; else echo "0"; fi; ) 
 
