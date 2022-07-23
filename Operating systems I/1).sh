#!/bin/bash
answer=y
while [[ $answer = "y" ]]; do
	t1=0
	t2=0
	t3=0
	t4=0
	t5=0
	read -p "Give the name of the directory : " dirname
	t1=$(find $dirname -type f -perm -$1| wc -l )
	echo Found $t1 files that had those permissions :
	find $dirname -type f -perm -$1

	t2=$(find $dirname -type f -mmin -$2  | wc -l)
	echo Found $t2 files that were modified the last $2 days :
	find $dirname -type f -mmin -$2 

	t3=$(find $dirname -type d -atime -$2 | wc -l)
	echo Found $t3 directories that were accessed the last $2 days :
	find $dirname -type d -atime -$2

	t4=$(find $dirname -type s -type p | wc -l)
	echo Found $t4 file type socket or pipe : 
	find $dirname -type s -type p 
	t5=$(find $dirname -type f -empty | wc -l)
	echo Found $t5 empty files :
	find $dirname -type f -empty 
	echo " Do you want to give onother directory (y/n) ? "
	read answer
	let t=t+t1+t2+t3+t4+t5



done
echo The sum of the files and directories found is $t
