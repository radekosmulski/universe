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
rbenv install 3.1.2
rbenv global 3.1.2
gem install bundler
rbenv rehash
