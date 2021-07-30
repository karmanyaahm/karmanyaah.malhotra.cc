So recently (as of starting writing this blog post a month ago) I spent a considerable amount of time offline or with unreliable internet (travelling :sigh:). So, I've been IPFSing a few code documentation things that could help with offline access. The TLDR of IPFS is it's a content addressed system, which means it doesn't care **where** the stuff is hosted; just **what** is hosted. This makes it really easy to back up the latest version of websites for offline access, among [many other advantages](//ipfs.io).

## Documentation

When going offline, until <//github.com/ipfs/go-ipfs/issues/8245> happens, the domain for any of these URLs will have to be set to the most current CID (Content ID (kinda the hash))  at /ipfs/\<CID\>. All of the following sites are updated manually for the time being by me so they might lag behind until I can figure out automation to do that. 

I also want to IPFS <//cht.sh>, but it seems like a more complex system I haven't gotten around to. If I had realized my situation earlier I would've downloaded all of cheat.sh, but I didn't :(.

1. IETF - Most commonly known for RFCs  
	[/ipns/ietf.karmanyaah.malhotra.cc](//ietf.karmanyaah.malhotra.cc)  
   	I just `rsync`ed rfc-editor.org and the formatting is the same. I have some better ideas, for example instead of URLs being /bcp/bcp1234.html, it could be /html/bcp/1234, but I haven't gotten around to scripting all that yet.
2. TLDR - Man Pages but simpler  
	An additional advantage of having the whole repo on IPFS locally, is the lookups are wayyy faster. Which makes sense if all the content is locally cached up-front. The following can be added to your shell initialization file (e.g. ~/.bashrc).
	```bash
	export TLDR_CACHE_ENABLED=0
	export TLDR_PAGES_SOURCE_LOCATION=http://localhost:8080/ipns/tldr.karmanyaah.malhotra.cc
	```
	This sets the TLDR URL to your local IPFS instance; also disabling the cache since IPFS is the perfect\* cache anyways.

3. Arch Wiki - The best GNU/Linux Wiki (controvertial? comment below (I'll be happy to see some comments regardless of the content))  
   [/ipns/archwiki.karmanyaah.malhotra.cc](//archwiki.karmanyaah.malhotra.cc)  
   Always useful in deubgging system setup and Linuxy things for not only Arch, but also other systems. I'm using [*Arch Wiki Docs*](//github.com/lahwaacz/arch-wiki-docs) which is the same script used to generate the Arch package [arch-wiki-docs](//archlinux.org/packages/community/any/arch-wiki-docs/). There are some problems with this process - most notably links don't work - but if someone has a better downloader script, I would be willing to try it.

### Honorary Mentions:
These are docs that are not hosted by me as part of this project, but are on IPFS which is very nice.

1. IPFS and Protocol Labs' own docs  
   [/ipns/docs.ipfs.io](//docs.ipfs.io) [/ipns/dnslink.dev](//dnslink.dev) [/ipns/filecoin.io](//filecoin.io)  
   duh.
2. unifiedpush.org - A spec (and implementations) for freedom respecting push notifications  
   [/ipns/unifiedpush.org](//unifiedpush.org) + F-Droid Repo [/ipns/repo.unifiedpush.org](//repo.unifiedpush.org)  
   This *is* being hosted by me on the same server as my personal website and the above docs, but it was S1m (@sim\_g:matrix.org) (primary UnifiedPush developer) who introduced me to IPFS when I was first helping build this website; this is natively hosted on IPFS.
3. [pacman.store](http://pacman.store) - Arch repos on IPFS

And the following are just IPFSified websites I found from my browser history.  

4. [xkcd.hacdias.com](//xkcd.hacdias.com)
5. [fission.codes](//fission.codes) - IPFS Publisher
6. [jargon.karmanyaah.malhotra.cc](//jargon.karmanyaah.malhotra.cc) - Jargon File, a comprehensive compendium of hacker slang illuminating many aspects of hackish tradition, folklore, and humor.  
   mirror of the original one
7. [projectserum.com](//projectserum.com) - Cryptocurrency thing
8. [app.uniswap.org](//app.uniswap.org) - Cryptocurrency

# Host setup

As you might have noticed, many of these sites are also served over HTTP or Gemini. This, and the IPFS pinning onto a server is done by a cron job which checks for the latest CID on the IPNS key; and if the CID is different, adds to MFS and replaces the copy of this data in the `/srv/` directory. Then, those files are served by Caddy and gmisrv. All of this is deployed by [this Ansible playbook]().

# Estuary

While I was tooting about individual mirrors being set up, [@mala@mastodon.social](//mastodon.social/@mala) responded with a suggestion about pinning the IETF mirror on [Estuary](//estuary.tech). Estuary is a Filecoin service that's currently invite only and it seems to be free for public datasets. And mala@mastodon.social also got me an invite for it. It's easy enough to use with existing IPFS resources, I just wrote a script that calls the `add-ipfs` api endpoint which eventually saves the CID onto Filecoin, retreiving it over IPFS. The script can be found [here in the repo]().

While not going on too much of a tangent, I think Filecoin is a very interesting idea with a lot of potential, and I hope it goes viral unlike some stupid cryptocurrencies that waste resources and drive up prices for no reason **cough**chia**cough**.

## DNSLink deploy script

Before the following solution, for my personal websites, I tried pointing DNSLink to IPNS and then that to IPFS; while it made sure the content was up to date pracitcally all the time, it was extremely slow to resolve. Maybe it's fundamental to the nature of a fully decentralized naming scheme when the publisher goes away, maybe the implementation is just lacking yet, I don't know, and I don't know enough about this field to be able to help. So, I switched to my other option. I use essentially the following script to publish my IPFS DNSLink. Note the following is trimmed to be educational, the real version can be found attached. `DOMAIN` and `DIR` are the inputs here. Preconditions are that that DNSLink record should already exist. The cloudflare access token and zone id is stored in Bitwarden and accessed with `rbw`.

```
BW_ENTRY=cloudflare_malhotra.cc_token
LOC="/website/$DOMAIN"

CID=$(ipfs add $DIR -rpQ --pin=false --cid-version=1 $CUSTOM_IPFS_ADD_OPTIONS)

if ipfs files ls -l "$LOC" | grep -q $CID; then
        echo already added $CID to $LOC
else
        echo adding $CID to $LOC
        ipfs files cp /ipfs/$CID "$LOC/$(date +%F_%T)"
fi

RECORD_DOMAIN="_dnslink.$DOMAIN"

# password is token and the custom field is for zone
SECRETS="$(rbw get $BW_ENTRY --full)"
CLOUDFLARE_TOKEN="$(echo "$SECRETS" | head -n 1)"
ZONE_ID="$(echo "$SECRETS" | grep -i zone | cut -d ' ' -f 2 )"

function curll {
        curl -s -H "Authorization: Bearer $CLOUDFLARE_TOKEN" -w '\n' -H "Content-Type:application/json" $@
}

RECORD_ID=$(curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$RECORD_DOMAIN"  | jq ".result[0].id" -r)
curll "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" -X PATCH --data "{\"content\":\"dnslink=/ipfs/$CID\"}"
```

These CIDs are also added to the MFS in `go-ipfs` but are not pinned. Having them in the MFS makes sure they won't be garbage collected, but makes it so I can human-readably remove extremely old versions whereas with unnamed pins that can be much more difficult. Though, ATM, all versions of my website since May 22 2021 use up just under 7 MB of space because the unchanged files are deduplicated by IPFS. Also, multiple versions of the IETF documents - where files remain 99% the same - consume barely a few megabytes more space.

## Etc. Thoughts

From the perspective of my website, IPFS provides the perfect way to cache bust URLs and have perfect (i.e. immutable) browser caches for CSS and JS assets. It also provides a unique oppurtunity for developers to rethink the difference between static assets and API; and how largely static (range of changing every several minutes) APIs could be practically infinitely horizontally scaled. The overhead for setting up a static site on IPFS is currently much more than just `rsync` or `scp`ing the files to the server, but I think the scaling potential makes up for that (though admitedly at the scale of a personal blog it doesn't even matter, but ideals :sigh:).

From the perspective of someone with bad internet (I can only speculate here because I have good internet at home), as the overhead of IPFS is being reduced, hopefully it opens up possibilties for people to connect to resources they couldn't otherwise have. This also could be useful (the concept not the current implementation) for actual interplanetary stuff. If common sites (news, movies etc) have a read-only mode that's IPFS, it should be possible example for one astronaut or space tourist to request a thing, and then that thing be locally cached for another person who might need it later, rather than having to request all the way from Earth each time.

Additionally with the recent Element - Protocol Labs thing [MSC2706](//github.com/matrix-org/matrix-doc/blob/travis/msc/ipfs/proposals/2706-IPFS.md) will be getting attention according to their blog post, which is very nice.

I hope these resources help someone travelling or who has bad internet.

P.S. plz comment for any questions/concerns


authors Notes:
order:
intro - advantages
problem + docs
host + estuary
estu scripts + dnslink
conclusion - hope help etc - future ipfs backup - matrix ipfs etc
