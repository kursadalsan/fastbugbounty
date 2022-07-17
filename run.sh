#!/bin/sh

cd ~/Desktop/
mkdir -p scanfast
cd ~/Desktop/scanfast/
mkdir $1 
cd $1
amass enum -passive -d $1 > 1.txt
httpx-toolkit -l 1.txt -o 3.txt
nuclei -t -t cves/ -t exposures/ -l 3.txt
