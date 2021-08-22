# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# for asdf completion
fpath=(${ASDF_DIR}/completions $fpath)
# enable asdf
source $HOME/.asdf/asdf.sh

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias gccx="gcc -Wall -Wextra -Werror"
alias browse="explorer.exe"

alias ga="git add "
alias gaA="git add -A"
alias gcm="git commit -m "
alias gpg="git push github"

alias python="python3"
alias pip="pip3"

alias rmx='\rm'
alias rm='echo "You should use trash-put (trm) command instead of rm."; false'
alias trm="trash-put"

alias open="xdg-open"
alias 'gittree'='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

alias here="gnome-terminal"
alias pbcopy='xsel --clipboard --input'


if [[ -x `which colordiff` ]]; then
  alias diff='colordiff'
fi

#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
export USER=rnakai
export MAIL=$USER@student.42tokyo.jp
# export PATH="$HOME/.rbenv/bin:$PATH"
#export NODE_PATH="/usr/local/lib/node_modules"
export PATH="${HOME}/.local/lib/go/bin:${PATH}"

## trash-put command path
#export PATH=~/.local/bin:"$PATH"
export LANG=en_US.UTF-8

# $eval "$(rbenv init -)"

# git のカラー表示
git config --global color.ui auto 

# 色を使用出来るようにする
autoload -Uz colors
colors

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vzsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

bindkey -v

######  show difference btwn normal and insert mode (https://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9)
autoload -Uz add-zsh-hook
autoload -Uz terminfo

# これをいれることで何故か余計な改行を入れなくなる。原因不明
terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
left_down_prompt_preexec() {
    print -rn -- $terminfo[el]
}
add-zsh-hook preexec left_down_prompt_preexec

autoload -Uz vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '%b'

function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        main|viins)
            PROMPT_2="$fg[cyan]-- INSERT --$reset_color"
            ;;
        vicmd)
            PROMPT_2="$fg[white]-- NORMAL --$reset_color"
            ;;
        vivis|vivli)
            PROMPT_2="$fg[yellow]-- VISUAL --$reset_color"
            ;;
    esac

    vim_prompt="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}"
    pwd_p="[%F{cyan}%~%f]"
    PROMPT="${vim_prompt}${pwd_p}%# "

    branch_info="%F{blue}[${vcs_info_msg_0_}]%f"
    RPROMPT="${branch_info}${user_prompt}"

    zle reset-prompt
}

#機能しない
branch_name="%F{blue}[$(git rev-parse --abbrev-ref HEAD 2> /dev/null)]%f"

# 終了ステータスでの条件分岐評価もあり. ?.  . で判定しているようだがソースなし
user_prompt="[%(?.%{${fg[green]}%}.%{${fg[red]}%})%n%{${reset_color}%}]"

setopt prompt_subst

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

## solve the bug about switching insert and normal mode. (https://github.com/denysdovhan/spaceship-prompt/issues/91)
bindkey "^?" backward-delete-char

###################

## able to use CTRL + R command in insert mode
##(https://unix.stackexchange.com/questions/44115/how-do-i-perform-a-reverse-history-search-in-zshs-vi-mode)
bindkey "^R" history-incremental-search-backward

## kubectl shell completion
source <(kubectl completion zsh)
