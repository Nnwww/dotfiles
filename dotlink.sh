[[ ! "$OSTYPE" == darwin* ]] && echo "This script only treat darwin now." && exit 2

ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/vim/.vim ~/.vim

mkdir -p ~/.config/nvim 2>/dev/null

ln -sf ~/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.vim ~/.config/nvim

if [ ! `type nvim >/dev/null 2>&1` ]; then
    brew install neovim/neovim/neovim
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

if [ ! `type tmux >/dev/null 2>&1` ]; then
    brew install tmux
fi

ln -sf ~/dotfiles/rcfiles/.tmux.conf ~/.tmux.conf

ln -sf ~/dotfiles/rcfiles/.vimperatorrc ~/.vimperatorrc
ln -sf ~/dotfiles/rcfiles/.ideavimrc ~/.ideavimrc

exec $SHELL -l
