#!/bin/sh
SCRIPT=$(basename $0)

# USERNUM holds the user number
USER_NUM="0"
# EXPECTED_ARGS holds the expected number of arguments
EXPECTED_ARGS="1"
# DOMNUM variable holds the mp domain number
DOMNUM="Your_Domain_Number"
# APIKEY holds the API key from mp
APIKEY="Your_API_Key"
# Temp file to hold curl output, delete it first if it exists
TEMPFILE="user_search.xml"

if [ -f $TEMPFILE ];
then
	rm $TEMPFILE
fi

#Check argument count to make sure the right number of args were passed

if [ $# -ne $EXPECTED_ARGS ]; then
	echo
	echo "Usage: $SCRIPT user"
	echo "  where user is the Mailprotector username"
	echo ""
	exit 1
fi
# Use curl to extract user data in xml format, the output is sent to $TEMPFILE
# The domain number is set as a variable making changes easier.  This could be changed
# to an argument passed on the command line.
# Note that the results are limited to 50 users (?limit=50) and search criteria is 
# passed as a command line argument ($1)

curl -s -u $APIKEY:X -X GET "https://console.mailprotector.com/domains/$DOMNUM/users.xml?limit=50&filter_field=name&filter_value=$1" > $TEMPFILE

# Process $TEMPFILE searching for an exact match to $1.  Grep searches for exactly <name>$1</name> and returns the 
# previous line (-B 1) and the "found" name ($1).  The results are passed through (head -1)
# which returns just the "id" line.  awk is used to retrieve just the numeric ID
# The numeric ID gets assigned to the USER_NUM variable

USER_NUM=$(cat $TEMPFILE | grep -B 1 "<name>$1</name>" | head -1 | awk -F"<" '{ printf "%s\n", substr($2,4,9) }')

# Lastly, send the CURL string to actually delete the user

curl -s -u $APIKEY:X -X DELETE https://console.mailprotector.com/users/$USER_NUM.xml

