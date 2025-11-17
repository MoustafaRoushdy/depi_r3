#!/bin/bash


echo "please select one of the following"
echo "1. cars"
echo "2. motorcycles"
echo "3. scooter"

read choice 

case "$choice" in
	1) echo "good choice" ;;
	2) echo "takecare very dangerous";;
	3) echo " wooow";;
	*) echo "this is the default choice";;
esac


function log_in(){

   read -p "please enter your username?" username
   read -p "please enter your password:" password
   if [ "$username" = "ahmed" ]; then
	   echo "correct username"
           if [ "$password" = "1234" ]; then 
		   echo "correct password"
		   echo "login"
	   fi
   else 
	   echo "login failed"
   fi
}

log_in
