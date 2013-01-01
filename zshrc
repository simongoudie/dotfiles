# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rex"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR="vim"
bindkey -v

export TODO=~/Dropbox/Notes/todo.txt

function t() { if [ $# -eq "0" ]; then cat $TODO; else echo "$@" >> $TODO; fi }

function tt() { sed -i -e "/$*/d" $TODO; }

export TERM="xterm-256color"
# alias subl ="nocorrect subl"
# alias tmux ="nocorrect tmux"
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g $*'

bindkey '^R' history-incremental-search-backward

# MOTD script
# let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
# let secs=$((${upSeconds}%60))
# let mins=$((${upSeconds}/60%60))
# let hours=$((${upSeconds}/3600%24))
# let days=$((${upSeconds}/86400))
# UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# get the load averages
#  read one five fifteen rest < /proc/loadavg

#  echo "$(tput setaf 2)
# `date +"%A, %e %B %Y, %r"`
# `uname -srmo`$(tput setaf 1)

# Uptime..............: ${UPTIME}
# Memory..............: `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB (Total)
# Load Averages.......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
# Running Processes...: `ps ax | wc -l | tr -d " "`
# External IP Address.: `wget -q -O - http://icanhazip.com/ | tail`
# Melbourne Weather...: `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=OCN|AU|VIC|MELBOURNE|" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`

# $(tput sgr0)"
