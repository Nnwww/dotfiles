" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'thinca/vim-quickrun'

" colorscheme
NeoBundle 'w0ng/vim-hybrid'

" estimable Dark powered plugins
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neco-syntax'

" Settings for coexitence of deoplete with neocomplete
if has('nvim')
  NeoBundleLazy 'Shougo/deoplete.nvim', {"autoload": {"insert": 1}}
  NeoBundleLazy 'ujihisa/neco-look', {'depends' : 'Shougo/deoplete.nvim'}
else
  NeoBundleLazy 'Shougo/neocomplete.vim', {"autoload": {"insert": 1}}
  NeoBundleLazy 'ujihisa/neco-look', {'depends' : 'Shougo/neocomplete.vim'}
endif

NeoBundleLazy 'Shougo/neosnippet', {"autoload": {"insert": 1}}
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kmnk/vim-unite-giti'

" operators
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'

" search and move
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/incsearch-fuzzy.vim'

" common uses
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sudo.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Konfekt/FastFold'

NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "dannyob/quickfixstatus"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "cohama/vim-hier"

" markdown
NeoBundle 'godlygeek/tabular'
NeoBundle 'tyru/open-browser.vim'
NeoBundleLazy 'plasticboy/vim-markdown',  {"autoload" : { "filetypes" : [ "markdown" ] }}
NeoBundleLazy 'kannokanno/previm',  {"autoload" : { "filetypes" : [ "markdown" ] }}

" Org-mode
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'jceb/vim-orgmode'

" Python
NeoBundle 'zchee/deoplete-jedi' " require pip install jedi

" OCaml
"NeoBundleLazy 'def-lkb/ocp-indent-vim',  {"autoload" : { "filetypes" : [ "ocaml" ] }}
NeoBundle 'def-lkb/ocp-indent-vim'

" Rust
" Syntax plugins don't be lazy, because it's not then applyed in markdown etc.
NeoBundle 'rust-lang/rust.vim'
NeoBundleLazy 'racer-rust/vim-racer' , {"autoload" : { "filetypes" : [ "rust" ] }}

" Haskell
NeoBundle 'neovimhaskell/haskell-vim'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'ujihisa/unite-haskellimport'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"Python3 support when using pyenv
if executable('pyenv')
  let g:python_host_prog = expand('$HOME') . '/.pyenv/shims/python2'
  let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python3'
endif

" loading depend on whether nvim or vim
if has('nvim')
  runtime! userautoload/base.nvim

  let s:hooks = neobundle#get_hooks("deoplete.nvim")
  function! s:hooks.on_source(bundle)
    runtime! userautoload/conf_deoplete.vim
  endfunction
else
  runtime! userautoload/base.vim

  let s:hooks = neobundle#get_hooks("neocomplete.vim")
  function! s:hooks.on_source(bundle)
    runtime! userautoload/conf_neocomplete.vim
  endfunction
endif

runtime! userautoload/conf_neosnippet.vim

" colorscheme
set background=dark
colorscheme hybrid
runtime! userautoload/second/*.vim
