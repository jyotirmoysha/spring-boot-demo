#!/bin/sh
echo "Hello Jyotirmoy, Checking URL is up or down"


#Initializing two variables 
a=20 
b=20 

if [ $a == $b ] 
then 
	#If they are equal then print this 
	echo "a is equal to b"
else
	#else print this 
	echo "a is not equal to b"
fi 

yourURL="http://18.222.218.139:8080/demo/hello"

if curl --output /dev/null --silent --head --fail "$yourURL"
then
    echo "This URL Exist"
else
    echo "This URL Not Exist"
fi
