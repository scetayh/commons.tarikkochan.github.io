.PHONY: all

all:
	make commons
	git add .
	git commit -a
	git push

commons:
	sudo indeux gen