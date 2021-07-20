#!/bin/bash

#Start Loop Process
while true; do

#Delete old files
rm /home/pi/PosterPi.txt
rm /home/pi/PosterPi.tmp

#Find all files, inc subdirs, add to PosterPi.txt
find /home/pi/PosterPi -name "*.*" > /home/pi/PosterPi.txt

#Shuffle first 50k lines, write to PosterPi.tmp
shuf -n 50000 /home/pi/PosterPi.txt > PosterPi.tmp

#Launch FBI viewer, read from PosterPi.tmp
fbi -a -1 -t 5 --noverbose -l /home/pi/PosterPi.tmp

#When FBI reaches the end of the list, begin again.
clear
done