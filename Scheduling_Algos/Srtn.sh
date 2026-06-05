#!/bin/bash

echo "Enter number of processes:"
read n

declare -a bt rt wt tat

for ((i=0;i<n;i++))
do
    echo "Enter Burst Time for P$((i+1)):"
    read bt[i]
    rt[i]=${bt[i]}
done

complete=0
time=0
min=9999
shortest=0

while [ $complete -ne $n ]
do
    min=9999

    for ((i=0;i<n;i++))
    do
        if [ ${rt[i]} -gt 0 ] && [ ${rt[i]} -lt $min ]
        then
            min=${rt[i]}
            shortest=$i
        fi
    done

    rt[$shortest]=$(( ${rt[$shortest]} - 1 ))

    if [ ${rt[$shortest]} -eq 0 ]
    then
        complete=$((complete+1))

        finish=$((time+1))
        wt[$shortest]=$((finish - bt[$shortest]))

        if [ ${wt[$shortest]} -lt 0 ]
        then
            wt[$shortest]=0
        fi
    fi

    time=$((time+1))
done

for ((i=0;i<n;i++))
do
    tat[i]=$((bt[i] + wt[i]))
done

echo "Process BT WT TAT"

for ((i=0;i<n;i++))
do
    echo "P$((i+1)) ${bt[i]} ${wt[i]} ${tat[i]}"
done