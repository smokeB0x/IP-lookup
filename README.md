# IP-lookup


Dependencies:

whois* (sudo apt install whois)

dos2unix** (sudo apt install dos2unix)

Whois lookup for multiple IP addresses in a file.
This script displays the values Org-name, description, and country, but it can easily be edited to search for and display other values as well.

List with IP-addresses must be saved in a file named "ip.txt" at the same location as the script

The result is saved in a .csv file named whois.csv with pipe (|) as the delimiter.

* The program used to get information about an IP address
** If the .txt file "ip.txt" is created on windows, the script will not work as the line shift encoding is different on windows and linux .txt files.  This converts the file to linux format. 
