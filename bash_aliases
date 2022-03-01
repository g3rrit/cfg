# source /usr/local/cfg/bash_aliases

alias fzf=fzf-tmux
alias ll='ls --color=auto -al'
alias www='python -m SimpleHTTPServer 8000'
alias vi=vim
alias rs='rsync -rvP'

# requires duckduckgo from the terminal ddgr and w3m
# sudo pacman -Ss w3m && yay -S ddgr
alias ggwik='BROWSER=w3m ddgr -w wikipedia.org -j'
# requires socli
# pacman -m pip install socli
alias ggso='BROWSER=w3m socli'

