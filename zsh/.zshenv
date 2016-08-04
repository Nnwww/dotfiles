export ZDOTDIR=~/dotfiles/zsh/

export XDG_CONFIG_HOME=~/.config

export PATH="/usr/local/sbin:$PATH"

# Haskell-stack path
export PATH="$HOME/.local/bin:$PATH"

export LESS='-F -g -i -M -R -S -w -X -z-4'

if [ `type nvim >/dev/null 2>&1` ]; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    export PAGER="less"
else
    export EDITOR="vim"
    export VISUAL="vim"
    export PAGER="less"
fi

# default ocaml compiler option
export OCAMLPARAM="_,bin-annot=1"
# This option make opam leave a source code of the installed package
export OPAMKEEPBUILDDIR=1

# Rust cargo
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.downloads/rust/src"
export CARGO_HOME="$HOME/.cargo"
