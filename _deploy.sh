#!/usr/bin/env bash

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to ipfs for $DOMAIN...\033[0m\n"

BW_ENTRY=cloudflare_malhotra.cc_token
LOC="/website/$DOMAIN"
CUSTOM_IPFS_OPTIONS="--api /ip4/127.0.0.1/tcp/5001 $CUSTOM_IPFS_OPTIONS"
CID=$(ipfs add $DIR -rpQ --pin=false --cid-version=1 $CUSTOM_IPFS_OPTIONS $CUSTOM_IPFS_ADD_OPTIONS)
echo added to $CID

ipfs files mkdir -p "$LOC" $CUSTOM_IPFS_OPTIONS
if ipfs files ls -l "$LOC" $CUSTOM_IPFS_OPTIONS| grep -q $CID; then
        echo already added $CID to $LOC
else
        echo adding $CID to $LOC
        ipfs files cp /ipfs/$CID "$LOC/$(date +%F_%T)" $CUSTOM_IPFS_OPTIONS
fi

RECORD_DOMAIN="_dnslink.$DOMAIN"

# password is token and custom fields called zone and for each record
SECRETS="$(rbw get $BW_ENTRY --full)"
CLOUDFLARE_TOKEN="$(echo "$SECRETS" | head -n 1)"
ZONE_ID="$(echo "$SECRETS" | grep -i zone | cut -d ' ' -f 2 )"

function curll {
        curl -s -H "Authorization: Bearer $CLOUDFLARE_TOKEN" -w '\n' -H "Content-Type:application/json" $@
}

RECORD_ID=$(curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$RECORD_DOMAIN"  | jq ".result[0].id" -r)
echo -n "dns $ZONE_ID/$RECORD_ID success: "
curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" -X PATCH --data "{\"content\":\"dnslink=/ipfs/$CID\"}" | jq '.success'

