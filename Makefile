default: run

run:
	bundle exec jekyll serve
deploy:
	JEKYLL_ENV="production" bundle exec jekyll build
	./_deploy.sh
assets-update:
	ipfs get -o ./assets/vendor/latest.cactus.chat /ipfs/QmaBeG7TVfNzgV1eQ9KLXJxUjEtJwFkhaR9LgjXuiZxDMM/v0.10.0
