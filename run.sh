#!/bin/sh

mkdir $1
cd $1
subfinder -d $1 -all -recursive -t 200 -silent -o 1.txt
assetfinder -subs-only $1 > 2.txt
findomain -t $1 > 3.txt
sublist3r -d $1 -t 50 -o 5.txt
subdominator -d $1 > 6.txt


cat *.txt > subs.txt
httpx-toolkit -l subs.txt -o http-subs.txt
nuclei -l http-subs.txt -s critical,high,medium,low
