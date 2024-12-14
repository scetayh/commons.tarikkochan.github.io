.PHONY: commons deploy

commons:
	sudo indeux -g

deploy:
	make commons
	git add .
	git commit -a
	git push