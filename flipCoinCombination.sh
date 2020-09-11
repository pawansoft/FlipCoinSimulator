!/bin/bash


echo "1: for Singlet"
echo "2: for Doublet"
echo "3: for Triplet"
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
function Triplet()
{
num=$1
         for ((counter=1; counter < $num; counter++))
        do
                flip=$((RANDOM%8))
                Dictionary[$flip]=$((${Dictionary[$flip]} +1))
        done
        HHH=$((${Dictionary[0]} *100 / $num ))
        TTT=$((${Dictionary[1]} *100 / $num ))
        THH=$((${Dictionary[2]} *100 / $num ))
        TTH=$((${Dictionary[3]} *100 / $num ))
        THT=$((${Dictionary[4]} *100 / $num ))
        HTT=$((${Dictionary[5]} *100 / $num ))
        HTH=$((${Dictionary[6]} *100 / $num ))
        HHT=$((${Dictionary[7]} *100 / $num ))


        echo "--------------------------------------------------------------------------------------"
        if [[ $HHH -gt $TTT && $HHH -gt $THH && $HHH -gt $TTH && $HHH -gt $THT && $HHH -gt $HTT && $HHH -gt $HTH && $HHH -gt $HHT ]]
        then
                echo "HHH = $HHH %"
        elif [[ $TTT -gt $HHH && $TTT -gt $THH && $TTT -gt $TTH && $TTT -gt $THT && $TTT -gt $HTT && $TTT -gt $HTH && $TTT -gt $HHT ]]
        then
                echo "TTT = $TTT %"
        elif [[ $THH -gt $TTT && $THH -gt $HHH && $THH -gt $TTH && $THH -gt $THT && $THH -gt $HTT && $THH -gt $HTH && $THH -gt $HHT ]]
        then
                echo "THH = $THH %"
	elif [[ $TTH -gt $TTT && $TTH -gt $THH && $TTH -gt $HHH && $TTH -gt $THT && $TTH -gt $HTT && $TTH -gt $HTH && $TTH -gt $HHT ]]
	then
		echo "TTH: $TTH %"
	elif [[ $THT -gt $TTT && $THT -gt $THH && $THT -gt $TTH && $THT -gt $HHH && $THT -gt $HTT && $THT -gt $HTH && $THT -gt $HHT ]]
	then
		echo "THT : $THT %"
	elif [[ $HTT -gt $TTT && $HTT -gt $THH && $HTT -gt $TTH && $HTT -gt $THT && $HTT -gt $HHH && $HTT -gt $HTH && $HTT -gt $HHT ]]
	then
		echo "HTT : $HTT %"
	elif [[ $HHT -gt $TTT && $HHT -gt $THH && $HHT -gt $TTH && $HHT -gt $THT && $HHT -gt $HTT && $HHT -gt $HTH && $HHT -gt $HHH ]]
	then
		echo "HHT : $HHT %"
        else
                echo "HTH = $HTH %"

        fi


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
"3")
	Triplet $num
	;;
*)
	echo "0"
	;;
esac
