#!/bin/bash

#This script takes a list of IP addresses in a text file called "ip.txt", does a whois search, and greps for org-name, description, and country 
#then outputs this to a file in csv format where pipe (|) is the delimiter

IP="IP-Adresse"													#Define headlines variables
OrgName="Organisasjonsnavn"											#Define headlines variables
Descr="Beskrivelse"												#Define headlines variables
Country="Land"													#Define headlines variables

echo $IP\|$OrgName\|$Descr\|$Country > whois.csv								#Write headlines variables in csv-format

File="ip.txt"													#Define input file
dos2unix $File													#Converts txt file in windows format, to unix format
Lines=$(cat $File)												#Open file and read lines


for ip in $Lines												#For each line in input file
	do													#Do the following (Start of loop)
		org=$(whois $ip | grep -i 'org-name\|orgname' | awk -F ':' '{print $2}' | xargs)		#Do a whois lookup, grep for org-name, and select the second value in the line, remove newlines. Define value as variable "org"
		des=$(whois $ip | grep -i 'descr' | awk -F ':' '{print $2}' | xargs)				#Do a whois lookup, grep for descr, and select the second value in the line, remove newlines. Define value as variable "des"
		country=$(whois $ip | grep -i 'country' | awk -F ':' '{print $2}' | xargs)			#Do a whois lookup, grep for country, and select the second value in the line, remove newlines. Define value as variable "country"
		echo $ip\|$org\|$des\|$country >> whois.csv							#Write the variables ip, org, des, and country to a file in csv-format
done														#End of loop
