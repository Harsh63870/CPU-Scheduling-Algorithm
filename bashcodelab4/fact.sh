#!/bin/bash
read -p "Enter a number: " num

if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a non-negative integer."
    exit 1
fi

fact=1

for (( i=1; i<=num; i++ ))
do
    fact=$((fact * i))
done

echo "Factorial of $num is: $fact"
