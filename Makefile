.PHONY: all deploy

all:
	make commons
	make deploy
	
commons:
	sudo indeux gen

deploy:
	git add .
	git commit
	git push