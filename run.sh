#!/bin/sh

mkdir $1 
cd $1
amass enum -passive -d $1 > subs.txt
httpx-toolkit -l subs.txt -o http-subs.txt
nuclei -t cves/ -t exposures/ -l http-subs.txt
