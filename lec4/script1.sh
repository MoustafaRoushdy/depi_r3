#!/bin/bash

echo "Hello World!"

echo "please enter your name:"
read name
#name="moustafa"

echo "The user name is $name"
echo "plase enter your age:"
read age
if [ $age -lt 18 ]
then
	echo "you are not allowed to have a driving licence"
elif [ $age -eq 18 ]
then
	echo "Happy birthday,only now you can have a licence"
else
	echo "you can have a driving licence"
fi
