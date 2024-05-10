if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

set nu
syntax on

set tabstop=4
set shiftwidth=4
set expandtab

nnoremap Y y$
nnoremap _ "_

nnoremap [[ [`
nnoremap ]] ]`
nnoremap [` [[
nnoremap ]` ]]

nnoremap x "_x
nnoremap s "_s
nnoremap c "_c

imap <S-CR> <End><CR>
imap <C-S-CR> <Home><CR><Up>

nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z
