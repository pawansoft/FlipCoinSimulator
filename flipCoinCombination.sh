#!/bin/bash


echo "1: for Singlet"
echo "2: for Doublet"
declare -A Dictionary


function Singlet()
{
        num=$1
        for ((counter=1; counter < $num; counter++))
        do
                flip=$((RANDOM%2))
                Dictionary[$flip]=$((${Dictionary[$flip]} +1))
        done
        SingHeadProb=$((${Dictionary[0]} *100 / $num ))
        SingTailProb=$((${Dictionary[1]} *100 / $num ))
        echo "----------------------------------------------------------------------------------------"
        if [ $SingHeadProb -ge $SingTailProb ]
        then
                echo "Head = $SingHeadProb %"
        else
                echo "Tail = $SingTailProb %"
        fi

        echo "Head: ${Dictionary[0]} Tail: ${Dictionary[1]}"
}
function Doublet()
{
 num=$1
         for ((counter=1; counter < $num; counter++))
        do
                flip=$((RANDOM%4))
                Dictionary[$flip]=$((${Dictionary[$flip]} +1))
        done
        SingHHProb=$((${Dictionary[0]} *100 / $num ))
        SingTTProb=$((${Dictionary[1]} *100 / $num ))
        SingHTProb=$((${Dictionary[2]} *100 / $num ))
        SingTHProb=$((${Dictionary[3]} *100 / $num ))

        echo "--------------------------------------------------------------------------------------"
        if [[ $SingHHProb -gt $SingTTProb && $SingHHProb -gt $SingTHProb && $SingHHProb -gt $SingHTProb ]]
        then
                echo "HH = $SingHHProb %"
        elif [[ $SingTTProb -gt $SingHHProb && $SingTTProb -gt $SingTHProb && $SingTTProb -gt $SingHTProb ]]
        then
                echo "TT = $SingTTProb %"
        elif [[ $SingTHProb -gt $SingTTProb && $SingTHProb -gt $SingHHProb && $SingTHProb -gt $SingHTProb ]]
        then
                echo "TH = $SignTHProb %"
        else
                echo "HT = $SignHTProb %"

        fi

        echo "HH: ${Dictionary[0]} TT: ${Dictionary[1]}  HT : ${Dictionary[2]}   TH : ${Dictionary[3]}"




}


read -p "Enter the times of flip" num;
read -p "Select the option: " option;

case "$option" in
"1")

	Singlet $num
	;;
"2")
	Doublet $num
	;;
*)
	echo "0"
	;;
esac



