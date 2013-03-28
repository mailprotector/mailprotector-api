#!/bin/sh
SCRIPT=$(basename $0)

# DOMNUM variable holds the default domain number
DOM_NUM="Your_default_domain_number"
# APIKEY holds the API key from mp
APIKEY="Your_Mailprotector_API_Key"
# Temp file to hold curl output, delete it first if it exists
TEMPFILE="mpsearch.xml"
# Delete the temporary file if it exists
if [ -f $TEMPFILE ]; then
	rm $TEMPFILE
fi

# If an argument was passed on the command line, use that domain instead
# of the default (DOM_NUM).  Curl is used to output up to 50 domains that
# match the search criteria (the name passed on the command line)

if [ $# -eq 1 ]; then
	# Use curl to get domains, limit 50, output to the $TEMPFILE
	curl -s -u $APIKEY:X -X GET "https://console.mailprotector.com/domains.xml?limit=50&filter_field=name&filter_value=$1" > $TEMPFILE
	# Process the $TEMPFILE looking for an exact match to the command line
	# argument ($1).  This step updates the numeric DOM_NUM variable
	DOM_NUM=$(cat $TEMPFILE | grep -B 2 "<name>$1</name>" | head -1 | awk -F"<" '{ printf "%s\n", substr($2,4,9) }')
fi

# Use curl to extract user data in xml format, the output is processed
# with xmlstarlet to pull id and user in csv format
# Note that the results are limited to 1000 users (?limit=1000).  Change this
# limit if you have more than 1,000 users in the domain.
# 
curl -s -u $APIKEY:X https://console.mailprotector.com/domains/$DOM_NUM/users.xml?limit=1000 | xmlstarlet sel -t -m '//user' -v 'id' -o ',' -v 'name' -n | grep -v ^$
