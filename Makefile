.PHONY: all clean

all:
	make clean
	make commons
	git add . && \
		git commit -a && \
			git push --set-upstream origin main

commons:
	sudo indeux gen

clean:
	sudo indeux remove