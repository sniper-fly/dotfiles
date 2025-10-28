# load modules
MODULES_PATH="${HOME}/Desktop/dotfiles/modules"

source ${MODULES_PATH}/aliases
source ${MODULES_PATH}/exports
source ${MODULES_PATH}/functions

# zsh本体の設定値など
source ${MODULES_PATH}/zshrc

## enable github cli completion
eval "$(gh completion -s zsh)"
eval "$(phantom completion zsh)"

## enable direnv
eval "$(direnv hook zsh)"

# git のカラー表示
git config --global color.ui auto

# for asdf completion
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# pnpm
export PNPM_HOME="/home/rnakai/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
