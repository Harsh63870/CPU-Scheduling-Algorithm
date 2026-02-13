#!/bin/bash
read a
read b
read c
if [ $a -gt  $b ]
then
temp=$a; a=$b; b=$temp;
fi
if [ $a -gt $c ]
then
temp=$a; a=$c; c=$temp;
fi
if [ $b -gt $c ]
then
temp=$b; b=$c; c=$temp;
fi
echo "Order : $a $b $c"
