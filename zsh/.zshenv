export EDITOR='vim'
export VISUAL='vim'
export PAGER='bat --color=always'
export LESS='-g -i -M -R -S -W -z-4 -x4'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

#enhancd
export ENHANCD_FILTER=fzf:fzy
export ENHANCD_HOOK_AFTER_CD="exa -lah -s type"

# aliases for convinience
alias l=${ENHANCD_HOOK_AFTER_CD}
alias lt="exa -Tlh"
alias sd="fd --type f --hidden --follow --exclude .git | sk -m --preview 'bat --style=numbers --color=always {}'"
alias sf="sk -m --ansi -i -c 'rg --color=always --line-number --hidden "{}"' "
alias em="emacsclient -n"
alias nv="nvim"
export PATH="${HOME}/.cargo/bin:$PATH"
