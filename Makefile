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

	# download mathjax and do stuff TODO
	
	mkdir -p assets/vendor/mathjax
	curl https://registry.npmjs.org/mathjax/-/mathjax-3.2.1.tgz | tar -C assets/vendor/mathjax -xzv package/es5 --strip-components=2
patch:
	(cat _patches/*) | patch -p0
clean:
	bundle exec jekyll clean
