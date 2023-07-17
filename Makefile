SHELL=/usr/bin/env bash
default: run

run:
	bundle exec jekyll serve -H :: $(ARGS)

build: clean
	JEKYLL_ENV="production" bundle exec jekyll build $(ARGS)
deploy: build
	DOMAIN="karmanyaah.malhotra.cc" DIR="./_site" ./_deploy.sh
	DOMAIN="k.malhotra.cc" DIR="./_site/k.malhotra.cc" ./_deploy.sh

assets-update:
	# some sort of local processed version of 0.10.0
	ipfs get -o ./assets/vendor/latest.cactus.chat /ipfs/bafybeifqofteg3zzk7etjrntarqjpjzcxyqo7ijg2qkw3kohs64gkcwgrq
	
	mkdir -p ./assets/vendor/gc.zgo.at/
	@# pulls latest count
	wget https://gc.zgo.at/count.js -O ./assets/vendor/gc.zgo.at/count.js --no-verbose
patch:
	(cat _patches/*) | patch -p0
clean:
	bundle exec jekyll clean
