#!/bin/bash


DU=$(df -hT | grep xfs)
DT=5 


while IFS= read -r line
do
    U=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    DIR_NAME=$(echo $line | grep xfs | awk -F " " '{print $NF}') 
    if [ "$U" -ge $DT ]
    then
        echo "$DIR_NAME disk usage is more than $DT, Current Usage Value is: $U...PLEASE CHECK"
    fi
done <<< $DU
