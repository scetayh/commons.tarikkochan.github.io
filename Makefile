.PHONY: deploy

deploy:
	git add .
	git commit -a
	git push

commons:
	sudo indeux -g
