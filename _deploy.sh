#!/bin/sh

# If a command fails then the deploy stops
set -e


RECORD_ZONE="malhotra.cc"
DOMAIN="karmanyaah.$RECORD_ZONE"
DIR="./_site"

BW_ENTRY=cloudflare_malhotra.cc_token

#####

LOC="/website/$DOMAIN"

printf "\033[0;32mDeploying updates to ipfs for $DOMAIN...\033[0m\n"

CID=$(ipfs add "$DIR" -rpQ --pin=false)
echo added to $CID

ipfs files mkdir -p "$LOC"
if ipfs files ls -l "$LOC" | grep -q $CID; then
	echo already added $CID to $LOC
else
	echo adding $CID to $LOC
	ipfs files cp /ipfs/$CID "$LOC/$(date +%F_%T)"
fi

RECORD_DOMAIN="_dnslink.$DOMAIN"

# password is token and custom fields called zone and for each record
if [ -z "$CLOUDFLARE_TOKEN" ]; then CLOUDFLARE_TOKEN="$(rbw get $BW_ENTRY || continue)"; fi

function curll {
	curl -s -H "Authorization: Bearer $CLOUDFLARE_TOKEN" -w '\n' -H "Content-Type:application/json" $@
}

ZONE_ID=$(curll "https://api.cloudflare.com/client/v4/zones?name=$RECORD_ZONE"  | jq ".result[0].id" -r)
RECORD_ID=$(curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$RECORD_DOMAIN"  | jq ".result[0].id" -r)
echo -n "dns $ZONE_ID/$RECORD_ID success: "
curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" -X PATCH --data "{\"content\":\"dnslink=/ipfs/$CID\"}" | jq '.success'

