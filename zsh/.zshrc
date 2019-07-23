# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
setopt share_history # シェルのプロセスごとに履歴を共有
setopt auto_list # 補完候補が複数ある時に、一覧表示
setopt auto_menu # 補完候補が複数あるときに自動的に一覧表示する
setopt hist_ignore_dups # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups # 重複したヒストリは追加しない
bindkey -e

autoload -Uz compinit
compinit

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*darwin*amd64*" \
      if:"[[ $OSTYPE == *darwin* ]]"

zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*linux*amd64*" \
      if:"[[ $OSTYPE != *darwin* ]]"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --color=always --line-number --hidden --glob "!.git"'

export FZF_COMPLETION_TRIGGER='::'
# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# auto completions
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"

zplug "b4b4r07/enhancd", use:init.sh

#theme
zplug "chrissicool/zsh-256color"
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
# 大文字を入力した場合小文字を補完しないが候補が存在しない場合小文字で補完する
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

zplug load
