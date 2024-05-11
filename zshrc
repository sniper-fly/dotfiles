# load modules
MODULES_PATH="${HOME}/Desktop/dotfiles/modules"

source ${MODULES_PATH}/aliases
source ${MODULES_PATH}/exports
source ${MODULES_PATH}/functions

# zsh本体の設定値など
source ${MODULES_PATH}/zshrc

## enable github cli completion
eval "$(gh completion -s zsh)"

# git のカラー表示
git config --global color.ui auto 

# enable asdf
source $HOME/.asdf/asdf.sh

# for asdf completion
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
