" for Yggdroot/indentLine
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" for operator-surround
" 公式サンプルだとsa/sd/srだがsurround.vimに合わせた
nmap ys <Plug>(operator-surround-append)
nmap ds <Plug>(operator-surround-delete)
nmap cs <Plug>(operator-surround-replace)

" for incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" fuzzy search
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" OCaml specific plugins driven ocp-indent-vim
" The error occurs when merlin is loaded in ftplugin
if executable('opam')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set runtimepath+=" . g:opamshare . "/merlin/vim"
endif

" A setting for coexitence of deoplete with neocomplete
if has('nvim')
  if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
  endif
  let g:deoplete#omni_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
else
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
endif

" Rust specific plugins driven vim-racer
let s:hooks = neobundle#get_hooks("vim-racer")
function! s:hooks.on_source(bundle)
  set hidden
  let g:rustfmt_autosave = 1
  let g:rustfmt_command = expand('~/.cargo/bin/rustfmt')
  let g:racer_cmd = expand('~/.cargo/bin/racer')
  let $RUST_SRC_PATH=expand('~/.downloads/rust/src')
endfunction
