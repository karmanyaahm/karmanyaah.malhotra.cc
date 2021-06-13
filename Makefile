default: run

run:
	bundle exec jekyll serve

build: 
	JEKYLL_ENV="production" bundle exec jekyll build
deploy: build
	./_deploy.sh
assets-update:
	ipfs get -o ./assets/vendor/latest.cactus.chat /ipfs/QmaBeG7TVfNzgV1eQ9KLXJxUjEtJwFkhaR9LgjXuiZxDMM/v0.10.0
	mkdir -p ./assets/vendor/gc.zgo.at/
	@# pulls latest count
	wget https://gc.zgo.at/count.js -O ./assets/vendor/gc.zgo.at/count.js --no-verbose
