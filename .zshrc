export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/Users/rnakai/Library/Python/2.7/bin/:/Users/rnakai/mylib/homebrew/bin/
export LSCOLORS=gxfxcxdxbxegedabagacad

autoload colors
colors
### prompt ######################
PROMPT="%{${fg[green]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{$reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
export LS_COLORS


# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'



alias ls='ls -G'

xxls ()
{
    \cd "$@" && ls
}
alias cd="xxls"
alias dirs="dirs -v"
alias norm='Norminette -R CheckForbiddenSourceHeader'
alias gcc='gcc -Wextra -Wall -Werror'

if type trash-put &> /dev/null
then
    alias rm=trash-put
fi
