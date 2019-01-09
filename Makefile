post:
	bundle exec rake new_post

page:
	echo "bundle exec rake new_page[pagename]"

generate:
	LC_ALL="en_US.UTF-8" LANG="en_US.UTF-8" bundle exec rake generate

preview:
	LC_ALL="en_US.UTF-8" LANG="en_US.UTF-8" bundle exec rake generate && bundle exec rake preview

deploy:
	LC_ALL="en_US.UTF-8" LANG="en_US.UTF-8" bundle exec rake generate && bundle exec rake deploy

help:
	echo post page generate preview deploy
