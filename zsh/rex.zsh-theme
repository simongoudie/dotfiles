function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
    print -D $PWD
}

function battery_charge() {
    if [ -e /bin/batcharge.py ]
        then
            echo `python /bin/batcharge.py`
    else
        echo ''
    fi
}

function put_spacing() {
    local git=$(git_prompt_info)
        if [ ${#git} != 0 ]; then
            ((git=${#git} - 10))
        else
            git=0
        fi

        local bat=$(battery_charge)
        if [ ${#bat} != 0 ]; then
            ((bat = ${#bat} - 18))
            else
               bat=0
        fi

        local termwidth
        (( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${bat} - ${git} ))

        local spacing=""
        for i in {1..$termwidth}; do
            spacing="${spacing} " 
                done
                echo $spacing
}

ARROWCOLOR="$fg[green]"

function zle-keymap-select {
if [ $ARROWCOLOR != "$fg[red]" ]; then ARROWCOLOR="$fg[red]"; else ARROWCOLOR="$fg[green]"; fi
    zle reset-prompt
    zle -N redisplay
}

function zle-line-init {
    ARROWCOLOR="$fg[green]"
    zle reset-prompt
    zle -N redisplay
}

function get_arrowcolor() {
    echo "$ARROWCOLOR→ $reset_color"
}

function precmd() {
    print -rP '
$fg[green]%n%{$reset_color%}@$fg[cyan]%m: $fg[yellow]$(get_pwd)$(put_spacing)$(git_prompt_info) $(battery_charge)'
}

zle -N zle-keymap-select
zle -N zle-line-init

PROMPT='$(get_arrowcolor)'

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
