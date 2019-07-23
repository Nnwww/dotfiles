export EDITOR='vim'
export VISUAL='vim'
export PAGER='bat --color=always'
export LESS='-g -i -M -R -S -W -z-4 -x4'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# goenv
export GOPATH="$HOME/go"
#enhancd
export ENHANCD_FILTER=fzy:fzf
export ENHANCD_HOOK_AFTER_CD="exa -lah"

# aliases for convinience
alias l="exa -lah"
alias lt="exa -Tlh"
alias sd="fd --type f --hidden --follow --exclude .git | sk -m --preview 'bat --style=numbers --color=always {}'"
alias sf="sk -m --ansi -i -c 'rg --color=always --line-number --hidden "{}"' "
alias em="emacsclient -n"
