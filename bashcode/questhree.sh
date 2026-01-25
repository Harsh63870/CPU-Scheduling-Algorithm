#!/bin/bash
echo "Enter Marks of 5 Subjects:"
read m1 m2 m3 m4 m5
sum=$((m1+m2+m3+m4+m5))
per=$((sum/5))
echo "Percentage = $per"
if [ $per -gt 95 ]
then
echo "A+"
elif [ $per -gt 85 ]
then
echo "A"
elif [ $per -gt 75 ]
then
echo "B+"
elif [ $per -gt 65 ]
then
echo "B"
else
echo "fail"
fi
