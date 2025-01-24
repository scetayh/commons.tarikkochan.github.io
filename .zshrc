# Created by newuser for 5.9

# function
function AsRoot () { [ "$(/usr/bin/whoami)" = "root" ]; }
function OnOsx () { [ -d /System ]; }
function OnGentoo () { [ -d /etc/portage ]; }
function InBash () { /bin/ps -p $$ | /usr/bin/grep bash &> /dev/null; }
function InZsh () { /bin/ps -p $$ | /usr/bin/grep zsh &> /dev/null; }
function StartWith () { [[ "$1" == $2* ]]; }
function EndWith () { [[ "$1" == *$2 ]]; }
function Contain () { [[ "$1" == *$2* ]]; }
function PathFormat () {
	while Contain "$PATH" ::; do declare -x PATH=${PATH/::/:}; done
	StartWith "$PATH" : && declare -x PATH=${PATH:1}
	EndWith "$PATH" : && declare -x PATH=${PATH:0:-1}
	return 0
}
function PathAppend () { declare -x PATH="$PATH:$*"; PathFormat; }
function PathAppendDefault () {
	for ((i=1; i<=$(/usr/bin/wc -l < /etc/paths); i++)); do {
		PathAppend "$(/usr/bin/sed -n ${i}p /etc/paths)"
	}
	done
	PathFormat
}
function PathAppendCustom () {
	PathAppend /usr/local/bin
	for i in /opt/homebrew/{opt/{{coreutils,ed,findutils,gawk,gnu-indent,gnu-sed,gnu-tar,gnu-which,grep,make}/libexec/gnubin,{binutils,ed,file-formula,unzip,llvm}/bin},{bin,sbin}}; do PathAppend "$i"; done
	for i in $HOME/.dotnet{,/tools}; do PathAppend "$i"; done
	PathAppend /Users/scetayh/.cargo/bin
	PathAppend $BLOG_DIRECTORY/node_modules/.bin
	for i in /opt/miniconda3/{bin,condabin}; do PathAppend "$i"; done
	PathFormat
}

# variable
OnOsx && {
	declare -x DOTNET_ROOT=$HOME/.dotnet
	declare -x BLOG_DIRECTORY=/Users/scetayh/Documents/blog
	declare -x BLOG_COMMONS_DIRECTORY=/Users/scetayh/Documents/repos/commons.tarikkochan.github.io
	declare -x HEXO_ALGOLIA_INDEXING_KEY="43e558ddb34e527169506593c80c7b9d"
	#[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
	#[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)
	# Set PATH, MANPATH, etc., for Homebrew.
	#declare -x HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
	declare -x HOMEBREW_BREW_GIT_REMOTE="git@github.com:Homebrew/brew"
	#declare -x HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
	declare -x HOMEBREW_CORE_GIT_REMOTE="git@github.com:Homebrew/homebrew-core"
	declare -x HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
	declare -x HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
}
declare -x LDFLAGS="-L/opt/homebrew/opt/binutils/lib"
declare -x CPPFLAGS="-I/opt/homebrew/opt/binutils/include"
declare -x FORCE_UNSAFE_CONFIGURE=1
declare -x LC_ALL=zh_CN.UTF-8
declare -x LANG=zh_CN.UTF-8
declare -x PS1='\e[01;34m\]$(e=$?; (( e )) && echo "$e ")\e[01;31m\]\h\[\e[01;34m\] \w $\[\e[00m\] '
declare -x PROMPT=$'(%F{9}exit %?%f)\n┌─[%F{219}%n%f@%F{111}%M%f]  %F{215}%B%D%b %*%f    %F{0}╱/( ◕‿‿◕ )\\%f\n└─┬─┤ %l %x %F{10}%!%f %F{111}%U%~%u%f\n  └─> %u%f%F{111}%B%#%b%f '
declare -x EDITOR=nvim

# PATH
OnOsx && { unset PATH; if AsRoot; then PathAppendDefault; PathAppendCustom; else PathAppendCustom; PathAppendDefault; fi; PathFormat; }

# plugin
OnOsx && InZsh && {
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	declare -x ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	chmod go-w '/opt/homebrew/share'
	chmod -R go-w '/opt/homebrew/share/zsh'
	#rm -f ~/.zcompdump; compinit
	if type brew &>/dev/null; then {
		declare -x FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

		autoload -Uz compinit
		compinit
	}
	fi
}

# conda
OnOsx && ! AsRoot && {
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
			. "/opt/miniconda3/etc/profile.d/conda.sh"
		else
			declare -x PATH="/opt/miniconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}

# shortcut
alias c="cat -n"
alias cmi="make distclean; ./configure && make clean && make -j && sudo make install"
alias cmi-j1="make distclean; ./configure && make clean && make -j1 && sudo make install"
alias l="ls -ahlF --color"
alias ping-tarikko="ping -c 3 blog.tarikkochan.top"
alias srmkh="sudo rm -f ~/.ssh/known_hosts"
alias sudo="sudo "
alias ya='yt-dlp -f "bestaudio/best" --format "bestaudio[ext!=webm]"'
alias yt=yt-dlp_macos
alias yt-dlp=yt-dlp_macos
alias zshrc-update="curl https://commons.tarikkochan.top/zshrc -o ~/.zshrc"
OnOsx && {
	alias blog="blog-cd && make"
	alias blog-cd="cd $BLOG_DIRECTORY"
	alias blog-commons="blog-commons-cd && make index"
	alias blog-commons-cd="cd $BLOG_COMMONS_DIRECTORY"
	alias ds0="sudo pmset -a disablesleep 0"
	alias ds1="sudo pmset -a disablesleep 1"
	alias p="declare -x https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
}
OnGentoo && {
	alias t+="sudo date -s 20300701"
	alias t-="sudo ntpdate -b -u 0.gentoo.pool.ntp.org && sudo hwclock --systohc"
	alias vmake="sudo $EDITOR /etc/portage/make.conf"
}
function loading() { while true; do for i in '|' '/' '-' '\'; do printf \\b$i; sleep 0.05; done; done; }
function n() { [ -f "$(which lolcat)" ] && { uname -a; neofetch; } | lolcat && return 0; uname -a; neofetch; }
function s() { InBash && source ~/.bashrc; InZsh && source ~/.zshrc; return 0; }
function v() { $EDITOR ~/.zshrc; s; blog-commons-cd; make zshrc; return 0; }
OnOsx && {
	function o() { [ -z "$1" ] && open . || open "$1"; }
	function sleepafter () {
		[ "$(whoami)" != "root" ] && \
			echo "$0: permission denied" && \
			return 1
		[ "$1" -lt 0 ] && \
			echo "$0: integer expected" && \
			return 1
		ds1
		echo -n $1
		sleep 1
		for ((i = 2; i <= $1; i++)); do {
			echo -n " $(($1 + 1 - i))"
			sleep 1
		}
		done
		echo
		ds0
		sudo shutdown -s +0
	}
}
