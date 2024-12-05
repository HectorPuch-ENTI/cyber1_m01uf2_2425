#!/bin/bash

echo "LSTP server (Lechuga Speaker Transfer Protocol)"

echo "0. LISTEN"

DATA=`nc -l 7777`

echo "3. CHECK HEADER"

if [ "$DATA" != "LSTP_1" ]
then
	echo "ERROR 1: Header mal formado. $DATA"

	echo "KO_HEADER" | nc localhost 7777

	exit 1
fi

echo "4. SEND OK_HEADER"

echo "OK_HEADER" | nc localhost 7777

echo "5. LISTEN FILE_NAME"

FILES=`nc -l 7777 | cut -d' ' -f1`

echo "9. CHECK FILE_NAME"

if [ "$FILES" != "FILE_NAME" ]
then
	echo "ERROR 2: File name mal formado. $FILES"

	echo "KO_FILE_NAME" | nc localhost 7777

	exit 2
fi
