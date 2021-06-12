#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to ipfs...\033[0m\n"

export JEKYLL_ENV="production"

# Build the project.
bundle-2.7 exec jekyll build # if using a theme, replace with `hugo -t <YOURTHEME>`

DIR="./_site"
KEY="mysite"
LOC="/website/karmanyaah.malhotra.cc"

ipfs add "$DIR" -rp --pin=false
echo "successfully added and pinned, now publishing"

CID=$(ipfs add "$DIR" -rQ --pin=false)
ipfs name publish -k $KEY $CID

echo "ipns published"

echo adding $CID to $LOC
ipfs files mkdir -p "$LOC"
ipfs files cp /ipfs/$CID "$LOC/$(date +%F_%T)"

echo "file added"

