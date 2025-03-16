alias git='LC_ALL=en_US git'
alias ls='LC_ALL=C ls -lah --color=auto'
alias cl='clear'
alias cls='clear && LC_ALL=C ls -lah --color=auto'

export PATH="$HOME/.bin:$PATH"

if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

