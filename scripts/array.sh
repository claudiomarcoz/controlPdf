#!/bin/bash

item=$2
continente="$1"
echo "$( echo "$continente" | cut -d" " -f$item 2> /dev/null )"