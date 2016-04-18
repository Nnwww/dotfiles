# pyenv settings
# Don't write these to zshenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

HISTFILE=~/dotfiles/zsh/.histfile

HISTSIZE=1000
SAVEHIST=1000

setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/dotfiles/zsh/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
# Manage with zplug
source ~/.zplug/zplug
zplug "b4b4r07/zplug"

zplug "plugins/git",  from:oh-my-zsh
zplug "themes/sorin", from:oh-my-zsh

# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "zsh-users/zsh-completions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

alias nv=nvim

if [ -z $TMUX ]; then
    tmux -2
fi

