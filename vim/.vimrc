" おそらく依存なしの設定
syntax enable
set nocompatible
set number
set ruler
set list
set whichwrap=b,s,h,l,<,>,[,]
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set backspace=indent,eol,start
set incsearch
set nohlsearch
set wrap
set showmatch
set showcmd
set whichwrap=h,l
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set helplang=en
set term=xterm-256color
set clipboard=unnamed
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" defalut indents
set shiftwidth=4
set tabstop=4
set softtabstop=4

" escが遠いため
noremap <C-j> <esc>
noremap! <C-j> <esc>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <C-j><C-j> :<C-u>nohlsearch<CR>

" 自動生成ファイルディレクトリ
set backupdir=~/.vim/backupfiles
set undodir=~/.vim/undofiles

" texのconceal無効化
let g:tex_conceal=''

" spaceを元に派生していく感じにしたい…
noremap  <Space>h  ^
noremap  <Space>l  $
noremap  <Space>r  %
nnoremap <Space>*  *

noremap <CR> o<ESC>

" 保存時に実行するコマンド
function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" 全角スペース表示


