#!/bin/sh

[[ ! "$OSTYPE" == darwin* ]] && echo "This script only treat darwin now." && exit 2

ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/vim/.vim ~/.vim

mkdir -p ~/.config/nvim 2>/dev/null

ln -sf ~/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.vim ~/.config/nvim

type nvim >/dev/null 2>&1
if [ $? = 1 ]; then

    type python3 >/dev/null 2>&1

    if [ $? = 1 ]; then
        brew install python3
        pip3 install --upgrade pip setuptools
    fi

    pip3 install neovim
    brew install neovim/neovim/neovim
    echo "Execute the :UpdateRemotePlugins or :NeoBundleRemotePlugins (for using NeoBundle) in Neovim and restart it."
fi

mkdir -p ~/dotfiles/vim/.vim/bundle 2>/dev/null

if [ ! -e ~/dotfiles/vim/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    ~/.vim/bundle/neobundle.vim/bin/neoinstall
fi

ln -sf ~/dotfiles/misc/private.xml ~/Library/Application\ Support/Karabiner/private.xml

ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv

if [ ! -e ~/.zplug ]; then
    mkdir ~/.zplug
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

type tmux >/dev/null 2>&1
if [ $? = 1 ]; then
    brew install tmux
    brew install reattach-to-user-namespace
fi

ln -sf ~/dotfiles/rcfiles/.tmux.conf ~/.tmux.conf

ln -sf ~/dotfiles/vimp/wasavi_ ~/.vimperatorc
ln -sf ~/dotfiles/rcfiles/.ideavimrc ~/.ideavimrc

exec $SHELL -l
