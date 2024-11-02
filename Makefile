.PHONY: deploy

commons:
	sudo indeux gen

deploy:
	git add .
	git commit
	git push