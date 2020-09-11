#!/bin/bash

h=0;
t=0;
declare -A Singlet
read -p "Enter the times of flip" num;
for ((counter=1; counter < $num; counter++))
do
	flip=$((RANDOM%2))
	if [ $flip -eq 1 ]
	then
		h=$((h+1))
		Singlet[1]=$h
	else
		t=$((t+1))
		Singlet[2]=$t
	fi
done
	SingHeadProb=$((${Singlet[1]} *100 / $num ))
	SingTailProb=$((${Singlet[2]} *100 / $num ))
echo "----------------------------------------------------------------------------------------"
if [ $SingHeadProb -ge $SingTailProb ]
then
	echo "Head = $SingHeadProb %"
else
	echo "Tail = $SingTailProb %"
fi

echo "Head: ${Singlet[1]} Tail: ${Singlet[2]}"
