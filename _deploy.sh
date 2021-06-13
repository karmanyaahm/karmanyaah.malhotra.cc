#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to ipfs...\033[0m\n"

DIR="./_site"
KEY="karmanyaah.malhotra.cc"
LOC="/website/$KEY"

ipfs add "$DIR" -rp --pin=false

CID=$(ipfs add "$DIR" -rQ --pin=false)
KEY_VALUE=$(ipfs key list -l | grep $KEY | cut -d ' ' -f1 | xargs ipfs name resolve) # resolves own key
echo $CID $KEY_VALUE
if [[ "/ipfs/$CID" == $KEY_VALUE ]]; then 
	echo "ALREADY PUBLISHED"
else
	echo PUBLISHING
	ipfs name publish -k $KEY $CID
fi


ipfs files mkdir -p "$LOC"
if ipfs files ls -l "$LOC" | grep -q $CID; then
	echo already added $CID to $LOC
else
	echo adding $CID to $LOC
	ipfs files cp /ipfs/$CID "$LOC/$(date +%F_%T)"
fi

