#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to ipfs for $DOMAIN...\033[0m\n"

DOMAIN="karmanyaah.malhotra.cc"
DIR="./_site"

BW_ENTRY=cloudflare_malhotra.cc_token
LOC="/website/$DOMAIN"

CID=$(ipfs add "$DIR" -rpQ --pin=false)
echo added to $CID

ipfs files mkdir -p "$LOC"
if ipfs files ls -l "$LOC" | grep -q $CID; then
	echo already added $CID to $LOC
else
	echo adding $CID to $LOC
	ipfs files cp /ipfs/$CID "$LOC/$(date +%F_%T)"
fi

RECORD_DOMAIN="_dnslink.$KEY"

# password is token and custom fields called zone and for each record
SECRETS="$(rbw get $BW_ENTRY --full)"
CLOUDFLARE_TOKEN="$(echo "$SECRETS" | head -n 1)"
ZONE_ID="$(echo "$SECRETS" | grep -i zone | cut -d ' ' -f 2 )"
RECORD_ID="$(echo "$SECRETS" | grep -i $RECORD_DOMAIN | cut -d ' ' -f 2)"

function curll {
	curl -s -H "Authorization: Bearer $CLOUDFLARE_TOKEN" -w '\n' -H "Content-Type:application/json" $@
}

echo -n "dns $ZONE_ID/$RECORD_ID success: "
curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" -X PATCH --data "{\"content\":\"dnslink=/ipfs/$CID\"}" | jq '.success'
