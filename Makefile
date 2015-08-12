deploy:
	git checkout master
	git pull origin master
	git checkout deploy
	git pull origin deploy
	git merge master
	rake generate
	git add -f ./public
	git commit -m "regenerated website"
	git push origin deploy
	heroku git:remote -a thepugglepaydevblog
	git push heroku deploy:master
	git checkout master
