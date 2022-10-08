# IP-lookup
Bash

Dependencies:
whois (sudo apt install whois)
dos2unix (sudo apt install dos2unix)

Whois lookup for multiple IP addresses in a file.
This script desplays the values Org-name, description, and country, but it can easily be edited to search for and display other values as well.

List with IP-addresses must be saved in a file named "ip.txt" at the same location as the script

The result is saved in a .csv file named whois.csv with pipe (|) as the delimiter.
