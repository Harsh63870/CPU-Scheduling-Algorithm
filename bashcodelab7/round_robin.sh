#!/bin/bash

echo "===== ROUND ROBIN CPU SCHEDULING ====="

read -p "Enter number of processes: " n
read -p "Enter Time Quantum: " tq

declare -a at
declare -a bt
declare -a rem_bt
declare -a wt
declare -a tat
declare -a rt

for ((i=0;i<n;i++))
do
    echo "Process P$i"
    read -p "Arrival Time: " at[$i]
    read -p "Burst Time: " bt[$i]
    read -p "Priority: " pr
    rem_bt[$i]=${bt[$i]}
    rt[$i]=-1
done

time=0
gantt=""

while :
do
    done=true

    for ((i=0;i<n;i++))
    do
        if [ ${rem_bt[$i]} -gt 0 ]
        then
            done=false

            if [ ${rt[$i]} -eq -1 ]
            then
                rt[$i]=$((time-at[$i]))
            fi

            if [ ${rem_bt[$i]} -gt $tq ]
            then
                gantt="$gantt P$i |"
                time=$((time+tq))
                rem_bt[$i]=$((rem_bt[$i]-tq))
            else
                gantt="$gantt P$i |"
                time=$((time+${rem_bt[$i]}))
                wt[$i]=$((time-bt[$i]))
                rem_bt[$i]=0
            fi
        fi
    done

    if $done
    then
        break
    fi
done

echo ""
echo "Gantt Chart:"
echo "$gantt"

echo ""
echo "Process   BT   WT   TAT   RT"

total_wt=0
total_tat=0
total_rt=0

for ((i=0;i<n;i++))
do
    tat[$i]=$((bt[$i]+wt[$i]))

    echo "P$i      ${bt[$i]}   ${wt[$i]}   ${tat[$i]}   ${rt[$i]}"

    total_wt=$((total_wt+wt[$i]))
    total_tat=$((total_tat+tat[$i]))
    total_rt=$((total_rt+rt[$i]))
done

echo ""
echo "Average WT: $(echo "$total_wt/$n" | bc -l)"
echo "Average TAT: $(echo "$total_tat/$n" | bc -l)"
echo "Average RT: $(echo "$total_rt/$n" | bc -l)"
