#!/bin/bash

#This script takes a list of IP addresses in a text file called "ip.txt", does a whois search, and greps for org-name and description, then outputs this to a file with the following format:
#IP address org-name Description

touch whois.txt
echo 'IP OrganisationName Description' > whois.txt

for ip in $(cat ip.txt); 
	do whois $ip | echo "$ip $(grep -i 'org-name\|descr' | awk -F ':' '{print $2}' | xargs)"; done >> whois-temp.txt
#do a whois lookup for org-name and descr for each IP in list - write to temp-file



cat whois-temp.txt | sort | uniq >> whois.txt
#sort lines in ascending order and remove duplicates

rm whois-temp.txt
#removes temp file

