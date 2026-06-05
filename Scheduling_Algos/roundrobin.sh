#!/bin/bash

echo "Enter number of processes:"
read n

declare -a bt rem wt tat

for ((i=0; i<n; i++))
do
    echo "Enter Burst Time for P$((i+1)):"
    read bt[i]
    rem[i]=${bt[i]}
done

echo "Enter Time Quantum:"
read tq

time=0

while true
do
    doneflag=1

    for ((i=0; i<n; i++))
    do
        if [ ${rem[i]} -gt 0 ]
        then
            doneflag=0

            if [ ${rem[i]} -gt $tq ]
            then
                time=$((time + tq))
                rem[i]=$((rem[i] - tq))
            else
                time=$((time + rem[i]))
                wt[i]=$((time - bt[i]))
                rem[i]=0
            fi
        fi
    done

    [ $doneflag -eq 1 ] && break
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