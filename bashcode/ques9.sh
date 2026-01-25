#!/bin/bash
echo "Enter Infix Expression:"
read exp
stack=""
output=""
priority() {
case $1 in
+|- ) echo 1 ;;
*|/ ) echo 2 ;;
* ) echo 0 ;;
esac
}
for ((i=0;i<${#exp};i++))
do
ch=${exp:i:1}
if [[ $ch =~ [A-Za-z0-9] ]]
then
output+=$ch
else
while [ -n "$stack" ] && [ $(priority ${stack: -1}) -ge $(priority $ch) ]
do
output+=${stack: -1}
stack=${stack%?}
done
stack+=$ch
fi
done
output+=$(echo "$stack" | rev)
echo "Postfix : $output"
