post:
	bundle exec rake new_post

page:
	echo "bundle exec rake new_page[pagename]"

generate:
	bundle exec rake generate

preview:
	bundle exec rake generate && bundle exec rake preview

deploy:
	bundle exec rake generate && bundle exec rake deploy
