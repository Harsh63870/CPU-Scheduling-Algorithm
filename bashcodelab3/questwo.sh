#!/bin/bash
echo "Enter the String : "
read str
if [[ $str == A*Z ]]
then
echo "YES"
else
echo "No"
fi
