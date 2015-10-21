#!/bin/bash

count=0
dir=$(pwd)
echo $dir
while [ ! $count -eq 20 ]; do
    echo $((RANDOM%20+30)) > $dir/graph_values/value
    sleep 2
    count=$((count + 1))
done
