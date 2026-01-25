#!/bin/bash
echo "Enter three Numbers:"
read a b c
if [ $a -gt $b ] && [ $a -gt $c ]
then
echo "biggest = $a"
elif [ $b -gt $c ]
then
echo "biggest = $b"
else
echo "biggest = $c"
fi
