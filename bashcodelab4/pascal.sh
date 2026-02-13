#!/bin/bash
read -p "Enter the number of rows: " rows

if ! [[ "$rows" =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a positive integer."
    exit 1
fi

for (( i=0; i<rows; i++ ))
do
    num=1
    for (( j=0; j<=i; j++ ))
    do
        echo -n "$num "
        num=$(( num * (i - j) / (j + 1) ))
    done
    echo
done
