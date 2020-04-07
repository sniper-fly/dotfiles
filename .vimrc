set number
syntax on
syntax enable

inoremap #in #include
inoremap #inio #include <stdio.h>
inoremap #inuni #include <unistd.h>
inoremap #main int		main(void)

set list listchars=tab:\▸\-

"""--------------------------------------------------------------------------
""" neobundle
""set nocompatible               " Be iMproved
""filetype off                   " Required!
""
""set runtimepath+=~/.vim/bundle/neobundle.vim/
""
""
""call neobundle#begin(expand('~/.vim/bundle/'))
""
""filetype plugin indent on     " Required!
""
""" Installation check.
""if neobundle#exists_not_installed_bundles()
""  echomsg 'Not installed bundles : ' .
""        \ string(neobundle#get_not_installed_bundle_names())
""  echomsg 'Please execute ":NeoBundleInstall" command.'
""  "finish
""endif
""
""NeoBundle 'Shougo/neosnippet.vim', {
""      \ 'depends' : ['Shougo/neosnippet-snippets'],
""      \ 'insert' : 1,
""      \ 'filetypes' : 'snippet',
""      \ 'unite_sources' : [
""      \ 'neosnippet', 'neosnippet/user', 'neosnippet/runtime'],
""      \ }
""
""call neobundle#end()
""
""filetype plugin indent on
""
""
""let g:neosnippet#snippets_directory = '$HOME/.vim/snippets/'
""
""" Plugin key-mappings.
""" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <C-k>     <Plug>(neosnippet_expand_or_jump)
""smap <C-k>     <Plug>(neosnippet_expand_or_jump)
""xmap <C-k>     <Plug>(neosnippet_expand_target)
""
""" SuperTab like snippets behavior.
""" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"""imap <expr><TAB>
""" \ pumvisible() ? "\<C-n>" :
""" \ neosnippet#expandable_or_jumpable() ?
""" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
""smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
""\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
""
""" For conceal markers.
""if has('conceal')
""  set conceallevel=2 concealcursor=niv
""endif
