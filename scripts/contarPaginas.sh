#!/bin/bash
echo "$(pdftk $1 dump_data | grep NumberOfPages | grep -o '[0-9]\+')"
