default: run

run:
	bundle exec jekyll serve
deploy:
	JEKYLL_ENV="production" bundle exec jekyll build
	./_deploy.sh
