#!/bin/bash

ln -sv $(pwd)/.vimrc $HOME/.vimrc

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Installing Packages"
sudo apt install python3 python cmake gcc python-dev python3-dev cmake gcc-c++ make python3-devel install build-essential
echo "Building YCM"
python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all
echo "Installing Vim Plugins"
vim -c "PluginInstall"
