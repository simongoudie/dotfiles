# Path to your oh-my-zsh configuration.
ZSH=$HOME//.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rex"

ZSH_DISABLE_COMPFIX="true"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias stonesoup="ssh joshua@crawl.akrasiac.org"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Remap j k for history search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export EDITOR="vim"
bindkey -v

#Esc-v edits command line in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# rough fix for sudo autocorrect annoyingness
alias sudo='nocorrect sudo'
alias ag='nocorrect ag'
alias python3='nocorrect python3'
alias vagrant='nocorrect vagrant'

if ls ~/Dropbox/Notes/todo.txt &> /dev/null 2>&1; then
   export TODO=~/Dropbox/Notes/todo.txt
else
   export TODO=~/todo.txt
fi
function t() { if [ $# -eq "0" ]; then cat $TODO; else echo "$@" >> $TODO; fi }
function tt() { sed -i -e "/$*/d" $TODO; }

export TERM="xterm-256color"
# alias subl ="nocorrect subl"
# alias tmux ="nocorrect tmux"
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g $*'

# fixes rake
alias rake='noglob rake'

bindkey '^R' history-incremental-search-backward

# Other aliases
# Copy pwd to clipboard
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Copy last output to clipboard
alias cl="fc -e -|pbcopy"

# Output number of todos
function todocount(){
#  if (( $+commands[td] ))
#    then
      num=$(echo $(t | wc -l))
      let todos=num #-2
      if [ $todos != 0 ]
        then
          echo "$todos"
        else
          echo "0"
        fi
#    else
#      echo ""
#  fi
}

# Clip script
function clip() {
    type=`file "$1"|grep -c text`
    if [ $type -gt 0 ]; then
        cat "$@"|pbcopy
        echo "Contents of $1 are in the clipboard."
    else
        echo "File \"$1\" is not plain text."
    fi
}
