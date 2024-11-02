.PHONY: all

all:
	make commons
	git add .
	git commit -a
	git push --set-upstream origin main

commons:
	sudo indeux gen