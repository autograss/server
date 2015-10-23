#!/bin/bash

count=0
dir=$(pwd)
echo $dir
while [ ! $count -eq 100 ]; do
    echo $((RANDOM%20+30)) > $dir/graph_values/value
    #echo $((RANDOM%20+30))
    sleep 2
    count=$((count + 1))
done
