#!/bin/bash

# install zsh
echo "ZSH install"
sudo apt-get install -y zsh
sudo apt-get install -y curl
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "************************************"
echo ""

# install tmux
echo "TMUX install"

sudo apt-get install -y tmux
sudo tee -a ~/.tmux.conf << EOF
# default settings
set -g base-index 1
set -g default-terminal "screen-256color"
set -g history-limit 10000
# use C-a instead of C-b
set -g prefix C-a
unbind C-b
# shorten command delay
set -sg escape-time 0
# bind keys
bind | split-window -h
bind - split-window -v
EOF

source ~/.tmux.conf
echo "************************************"
echo ""

# install openssh-server
echo "openssh-server install"
sudo apt-get install -y openssh-server
echo "************************************"
echo ""

# vim setting
echo "VIM install"
git clone https://github.com/wnaldj1589TW/SimpleVimTutorial
cd SimpleVimTutorial

RELATIVE_DIR=`dirname "$0"`
CUR_PATH=`readlink -f $RELATIVE_DIR`

sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4AB0F789CBA31744CC7DA76A8CF63AD3F06FC659
sudo apt update
sudo apt install -y vim clang-format

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat $CUR_PATH/vimrc >> ~/.vimrc
cat $CUR_PATH/plugin_list >> ~/.vimrc

vim +slient +VimEnter +PlugInstall +qall

cd ../
rm -rf $RELATIVE_DIR/SimpleVimTutorial
sudo chown -R $USER ~/.vim
echo "************************************"
echo ""