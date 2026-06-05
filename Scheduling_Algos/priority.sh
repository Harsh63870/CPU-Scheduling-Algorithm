#!/bin/bash

echo "Enter number of processes:"
read n

declare -a bt pr pid wt tat

for ((i=0; i<n; i++))
do
    pid[i]=$((i+1))

    echo "Enter Burst Time for P${pid[i]}:"
    read bt[i]

    echo "Enter Priority for P${pid[i]} (Lower Number = Higher Priority):"
    read pr[i]
done

for ((i=0; i<n-1; i++))
do
    for ((j=i+1; j<n; j++))
    do
        if [ ${pr[i]} -gt ${pr[j]} ]
        then
            temp=${pr[i]}
            pr[i]=${pr[j]}
            pr[j]=$temp

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

echo "Process Priority BT WT TAT"
for ((i=0; i<n; i++))
do
    echo "P${pid[i]} ${pr[i]} ${bt[i]} ${wt[i]} ${tat[i]}"
done