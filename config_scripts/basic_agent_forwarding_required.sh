# Sync dot files
rm .bashrc .vimrc
git clone --bare git@github.com:radekosmulski/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout headless
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
git config --global core.excludesfile '~/.gitignore_global'

vim +PluginInstall +qall > /dev/null
mkdir ~/.vimtmp
