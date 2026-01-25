#!/bin/bash
echo "Enter a number:"
read num
echo "Enter a limit"
read limit
for ((i=1;i<=limit;i++))
do
echo "$num x $i = $((num*i))"
done

