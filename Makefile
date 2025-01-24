.PHONY: zshrc index

zshrc:
	cp ~/.zshrc zshrc
	sudo indeux -g
	git add .
	git commit -a -m "update zshrc"
	export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
	git push --set-upstream origin main

index:
	sudo indeux -g
	git add .
	git commit -a
	export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
	git push --set-upstream origin main
