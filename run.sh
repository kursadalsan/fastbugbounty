#!/bin/sh

mkdir $1 
cd $1
amass enum -passive -d $1 > 1.txt
subfinder -d $1 > 2.txt
cat *.txt > subs.txt
httpx-toolkit -l subs.txt -o http-subs.txt -t 150
nuclei -t cves/ -t default-logins/ -t exposed-panels/ -t takeovers/ -t vulnerabilities/ -t iot/ -l http-subs.txt -rl 250 -bs 50
