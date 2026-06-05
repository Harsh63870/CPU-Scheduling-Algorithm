#!/bin/bash

echo "Enter number of processes:"
read n

declare -a bt pid wt tat

for ((i=0; i<n; i++))
do
    pid[i]=$((i+1))
    echo "Enter Burst Time for P${pid[i]}:"
    read bt[i]
done

for ((i=0; i<n-1; i++))
do
    for ((j=i+1; j<n; j++))
    do
        if [ ${bt[i]} -gt ${bt[j]} ]
        then
            temp=${bt[i]}
            bt[i]=${bt[j]}
            bt[j]=$temp

            temp=${pid[i]}
            pid[i]=${pid[j]}
            pid[j]=$temp
        fi
    done
done

wt[0]=0

for ((i=1; i<n; i++))
do
    wt[i]=$((wt[i-1] + bt[i-1]))
done

for ((i=0; i<n; i++))
do
    tat[i]=$((wt[i] + bt[i]))
done

echo "Process BT WT TAT"
for ((i=0; i<n; i++))
do
    echo "P${pid[i]} ${bt[i]} ${wt[i]} ${tat[i]}"
done