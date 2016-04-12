" general utility settings
" Vimrc augroup
augroup MyVimrc
    autocmd!
augroup END
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>

AutocmdFT vim highlight def link myVimAutocmd vimAutoCmd
AutocmdFT vim match myVimAutocmd /\<\(Autocmd\|AutocmdFT\)\>/
" e.g.)
"before) autocmd MyVimrc FileType help nnoremap <buffer> q <C-w>c
"after ) Autocmd FileType help nnoremap <buffer> q <C-w>c

" start vim
set runtimepath+=~/.vim/
runtime! userautoload/conf_neobundle.vim
