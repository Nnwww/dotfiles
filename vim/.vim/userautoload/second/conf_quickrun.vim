let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

" Typing q close quickfix
au FileType qf nnoremap <silent><buffer>q :quit<CR>

" Typing \r close quickfix and save a file, then execute quickrun.
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>

" Typing <C-c> stop quickrun.
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" watchdogs.vim setting
let g:watchdogs_check_BufWritePost_enable = 1

" watchdogs hook
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "outputter/quickfix/open_cmd" : "",
      \ "hook/qfstatusline_update/enable_exit" : 1,
      \ "hook/qfstatusline_update/priority_exit" : 4,
      \ 'hook/qfsigns_update/enable_exit':   1,
      \ 'hook/qfsigns_update/priority_exit': 3,
      \ }

let g:quickrun_config["haskell/watchdogs_checker"] = {
      \ "type" : "watchdogs_checker/ghc-mod",
      \ }

call watchdogs#setup(g:quickrun_config)
