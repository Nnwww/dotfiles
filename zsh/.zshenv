export EDITOR='vim'
export VISUAL='vim'
export PAGER='bat --color=always'
export LESS='-g -i -M -R -S -W -z-4 -x4'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# export GOPATH="/Users/oiharukawa/Workspace/share_vboxsf/go:$GOPATH"
# goenv
export GOPATH="${HOME}/go"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
#enhancd
export ENHANCD_FILTER=fzy:fzf
export ENHANCD_HOOK_AFTER_CD="exa -lah"

# aliases for convinience
alias l="exa -lah"
alias lt="exa -Tlh"
alias sd="fd --type f --hidden --follow --exclude .git | sk -m --preview 'bat --style=numbers --color=always {}'"
alias sf="sk -m --ansi -i -c 'rg --color=always --line-number --hidden "{}"' "
alias em="emacsclient -n"

# for mysql@5.7 setting
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# for compilers to find mysql@5.7 you may need to set:
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

# for pkg-config to find mysql@5.7 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
# for the system jdk version(macOS only)
export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "11")
export PATH=${JAVA_HOME}/bin:${PATH}
