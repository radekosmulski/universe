#!/bin/bash
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt remove -y vim
sudo apt install -y vim-gnome htop x11-xkb-utils
sudo apt --assume-yes autoremove

# Begin vim config
sudo apt-get install fonts-powerline # required on the machine running the terminal
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc
echo "call vundle#begin()" >> ~/.vimrc
echo "Plugin 'flazz/vim-colorschemes'" >> ~/.vimrc
vim +PluginInstall +qall > /dev/null

# Without this git will ask to manually confirm the fingerprint for github.com
echo 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=='  >> ~/.ssh/known_hosts

# Sync dot files
rm .bashrc .vimrc
git clone --bare git@github.com:radekosmulski/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout headless
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
git config --global core.excludesfile '~/.gitignore_global'

vim +PluginInstall +qall > /dev/null
mkdir ~/.vimtmp

# Install rbenv
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev build-essential
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Get ruby and bundler
rbenv install 2.5.1
rbenv global 2.5.1
gem install bundler
rbenv rehash

gem install tmuxinator
