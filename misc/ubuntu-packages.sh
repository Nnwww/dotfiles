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
curl -fsSLO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
sudo dpkg -i ripgrep_11.0.1_amd64.deb
rm ripgrep_11.0.1_amd64.deb

# install fzf, use zplug on zsh

# install fd
curl -fsSLO https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb
sudo dpkg -i fd_7.3.0_amd64.deb
rm fd_7.3.0_amd64.deb

# install exa

# install bat
curl -fsSLO https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
sudo dpkg -i bat_0.11.0_amd64.deb
rm bat_0.11.0_amd64.deb

# install zsh
sudo apt-get -y install zsh

# install onedrive
# move the path of journal file to onedrive

# install tmux
sudo apt-get -y install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#install rdp
sudo apt-get -y install xrdp tightvncserver
#link xsession

# install lightdm
sudo apt-get install lightdm
sudo dpkg-reconfigure lightdm
echo '[SeatDefaults]' | sudo tee /etc/lightdm/lightdm.conf.d/50-unity-greeter.conf
echo 'greeter-session=unity-greeter' | sudo tee -a /etc/lightdm/lightdm.conf.d/50-unity-greeter.conf
# install xmonad, and then put xmonad.hs into ~/.xmonad, xmonad --recompile

curl -fsSLO 'https://dl.bintray.com/tigervnc/stable/ubuntu-16.04LTS/amd64/tigervncserver_1.7.1-1ubuntu1_amd64.deb'
sudo dpkg -i tigervncserver_1.7.1-1ubuntu1_amd64.deb
rm tigervncserver_1.7.1-1ubuntu1_amd64.deb
