# load modules
source ./modules/aliases
source ./modules/exports
source ./modules/functions

# zsh本体の設定値など
source ./modules/zshrc

## enable github cli completion
eval "$(gh completion -s zsh)"

# git のカラー表示
git config --global color.ui auto 

# for asdf completion
fpath=(${ASDF_DIR}/completions $fpath)
# enable asdf
source $HOME/.asdf/asdf.sh
