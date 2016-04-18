export ZDOTDIR=~/dotfiles/zsh/

export XDG_CONFIG_HOME=~/.config

export PATH="/usr/local/sbin:$PATH"

export LESS='-F -g -i -M -R -S -w -X -z-4'

if [ `type nvim >/dev/null 2>&1` ]; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    export PAGER="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
    export PAGER="less"
fi
