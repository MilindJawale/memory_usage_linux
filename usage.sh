#!/bin/bash
alert=14
df -h | awk '{print$5" "$1}' | while read output
do
usage=$( echo $output | awk '{print$1}' | cut -d'%' -f1)
file=$(echo $output | awk '{print$2}')
case $(($usage)) in
     ([0-9]|[1-9][0-9]|100)              
            if [ $((usage)) -gt $alert ]
             then
             echo "$file critical"
             fi ;;
esac
done
