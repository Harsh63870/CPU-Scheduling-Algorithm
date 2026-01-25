#!/bin/bash
echo "enter number"
read a
if [ $a == 0 ]
then
echo "zero"
elif [ ` expr $a % 2 ` = 0 ]
then
echo "its even"
else
echo "its odd"
fi
echo "end of script"
