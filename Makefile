.PHONY: all clean

all:
	make clean
	make commons
	sleep 0.5
	git add . && \
		git commit -a && \
			git push --set-upstream origin main

commons:
	sudo indeux gen

clean:
	sudo indeux remove