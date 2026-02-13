#!/bin/bash

echo "Enter first string:"
read str1

echo "Enter second string:"
read str2

sorted1=$(echo "$str1" | grep -o . | sort | tr -d '\n')
sorted2=$(echo "$str2" | grep -o . | sort | tr -d '\n')

if [ "$sorted1" == "$sorted2" ]; then
    echo "Strings are anagrams"
else
    echo "Strings are NOT anagrams"
fi

