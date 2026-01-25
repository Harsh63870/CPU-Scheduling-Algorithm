#!/bin/bash
echo " enter a number "
read a
flag=0
if [ $a -le 1 ]
then
flag=1
else
for (( i=2; i<=a/2; i++ ))
do
if [ $((num%i)) -eq 0 ]
then
flag=1
break
fi
done
fi
if [ $flag -eq 0 ]
then
echo "prime number"
else
echo "not prime"
fi

