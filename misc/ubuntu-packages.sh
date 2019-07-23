# install spacemacs

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs26

# install enpass
sudo -i
echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -
exit

sudo apt-get -y install curl libcurl3 # for xenial
apt-get -y update
apt-get -y install enpass
sudo apt install libpulse0

# install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
sudo dpkg -i ripgrep_11.0.1_amd64.deb
rm ripgrep_11.0.1_amd64.deb

# install fzf, use zplug on zsh

# install fd
curl -LO https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb
sudo dpkg -i fd_7.3.0_amd64.deb
rm fd_7.3.0_amd64.deb

# install exa

# install bat
curl -LO https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
sudo dpkg -i bat_0.11.0_amd64.deb
rm bat_0.11.0_amd64.deb

# install zsh
sudo apt-get -y install zsh
