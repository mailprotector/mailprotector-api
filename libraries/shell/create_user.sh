#!/bin/sh
SCRIPT=$(basename $0)

# EXPECTED_ARGS holds the expected number of arguments
EXPECTED_ARGS="3"
# DOMNUM variable holds the mp domain number
DOMNUM="Your_Domain_Number"
# APIKEY holds the API key from mp
APIKEY="Your_API_Key"
TEMPFILE="create_user.xml"

if [ -f $TEMPFILE ]; then
	rm $TEMPFILE
fi

#Check argument count to make sure the right number of args were passed

if [ $# -ne $EXPECTED_ARGS ]; then
	echo
	echo "Usage: $SCRIPT user firstname lastname"
	echo "  where user is the Mailprotector username"
	echo "        firstname is the first name"
	echo "        lastname is the last name"
	echo ""
	exit 1
fi

# Use curl to post user data
# The domain number is set at the beginning of the script.

curl -s -u $APIKEY:X -H 'Content-Type:application/xml' -d "{<user><name>$1</name><first_name>$2</first_name><last_name>$3</last_name></user>" https://console.mailprotector.com/domains/$DOMNUM/users.xml > $TEMPFILE

grep -q "<created_at>" $TEMPFILE && echo "Success"
grep -q "<error>" $TEMPFILE && echo "Error.  Check create_user.xml"
