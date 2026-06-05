#!/bin/bash

echo "Enter number of processes:"
read n

declare -a bt wt tat

for ((i=0; i<n; i++))
do
    echo "Enter Burst Time for P$((i+1)):"
    read bt[i]
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
    echo "P$((i+1)) ${bt[i]} ${wt[i]} ${tat[i]}"
done