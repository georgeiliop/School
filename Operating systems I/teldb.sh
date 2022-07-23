#!/bin/bash
touch catalog.txt
answ="yes" #answer
while [[ $answ == "yes" ]]; do
	echo "You have 6 options : 
	type '-a' to add a new registration
	type '-l' to show the contents of the list
	type '-s' to sort the list
	type '-c' to give a keyword
	type '-d' to delete lines that contain a certain keyword
	type '-n' to show the number of empty lines of the list"
	read option
	case $option in
		-a) 
			read -p "Give first name :" firstname
			read -p "Give last name :" lastname
			read -p "Give city :" city
			read -p "Give number :" number
			echo -e $firstname $lastname $city $number >> catalog.txt
			;;
		-l)
			 grep . catalog.txt | cat -n 
			;;
		-s)
			read sortline
			sort -k $sortline catalog.txt
			;;
		-c)
			read -p  "Give a keyword :" keyword
			t1=$(grep $keyword /home/finixorigin/Documents/catalog.txt | wc -l)
			if [ $t1 -eq  0 ]; then
				echo There are no lines matching that keyword.
			else
				grep $keyword catalog.txt
			fi
			;;
		-d)
			read -p "Give a keyword :" key
			read -p "Type -b if you want to add an empty line in the deleted ones , else type -r : " par
			t3=$(grep $key /home/finixorigin/Documents/catalog.txt | wc -l) 
			if [ $t3 -eq 0 ]; then
				echo There are no lines matching that keyword.
			else
				if [[ "$par" == "-b" ]]; then
					sed  's/.*'"$key"'.*//' catalog.txt
					sed -i 's/.*'"$key"'.*//' catalog.txt
				else
					sed  '/'"$key"'/d' catalog.txt
					sed -i '/'"$key"'/d' catalog.txt
				fi
			fi
			;;
		-n)
			t2=$(grep -c "^$" /home/finixorigin/Documents/catalog.txt )
			echo  "The number of empty lines is $t2 , do you want to delete them? ( yes/ no )"
			read answer
			if [[ $answer == "yes" ]]; then
				sed -i '/^$/d' catalog.txt
				echo They have been removed!
			fi
			;;

		*)
			echo "There is no such an option , please give one of the following ones :
			type '-a' to add a new registration
			type '-l' to show the contents of the list
			type '-s' to sort the list
			type '-c' to give a keyword
			type '-d' to delete lines that contain a certain keyword
			type '-n' to show the number of empty lines of the list"





	esac
	echo "Do you want to do something else? (yes/no) "
	read answ
done


	


