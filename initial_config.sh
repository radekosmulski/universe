#!/bin/bash

sudo apt remove -y vim
sudo apt install -y vim-gnome htop
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc
echo "call vundle#begin()" >> ~/.vimrc
echo "Plugin 'flazz/vim-colorschemes'" >> ~/.vimrc
vim +PluginInstall +qall > /dev/null

git clone https://github.com/radekosmulski/dot-files
pushd dot-files
cp .bashrc .gitignore .gitignore_global .tmux.conf .vimrc ../
popd
vim +PluginInstall +qall > /dev/null

git config --global core.excludesfile '~/.gitignore_global'

mkdir ~/.vimtmp
