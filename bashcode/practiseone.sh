#!/bin/bash
echo "String"
read str
rev_str=$(echo "$str" | rev)
if [ "$str" == "$rev_str" ]
then
echo "pallindrome"
else
echo "not"
fi
