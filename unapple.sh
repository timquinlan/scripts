#!/bin/sh

if [ -z $1 ]
then
	echo "must provide a prefix"
	exit 1
else 
	prefix=$1
fi

detox *

for i in $(ls)
do
	echo "$prefix-$i"
done

echo "rename y/n"
read Y
if [ $Y = y ]
then
	for i in $(ls)
	do
		mv $i $prefix-$i
	done
else
	exit
fi

echo "move y/n"
read Y

if [ $Y = y ]
then
	mv -i *.m4v ~/Videos
	mv -i *.jpg ~/Pictures
else
	exit
fi

echo "rm this dir? y/n"
read Y

if [ $Y = y ]
then
	dirname=$(pwd | awk -F/ '{print $NF}')
	cd ..
	rmdir "$dirname"
else
	exit
fi
