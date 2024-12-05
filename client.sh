#!/bin/bash

echo "LSTP Client(Lechuga Speaker Transfer Protocol)"

echo "1. SEND HEADER"

echo "LSTP_1" | nc localhost 7777

echo "2.LISTEN OK_HEADER"

DATA=`nc -l 7777`

echo "6. CHECK OK_HEADER"

if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: Header enviado incorrectamente."

	exit 1
fi

#cat client/lechuga1.lechu | text2wave -o client/lechuga1.wav

#yes | ffmpeg -i client/lechuga1.wav client/lechuga1.ogg

echo "7. SEND FILE_NAME"

echo "FILE_NAME lechuga.ogg"  | nc localhost 7777

echo "8. LISTEN FILE_NAME"

FILES=`nc -l 7777`

echo "10. CHECK FILE_NAME"

if [ "$FILES" != "FILE_NAME" ]
then
	echo "ERROR 2: FILE_NAME enviado incorrectamente."

	exit 2 
fi
