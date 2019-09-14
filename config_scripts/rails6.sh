curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn

sudo apt install yarn chromium-chromedriver
sudo ln -s /usr/lib/chromium-browser/chromedriver /usr/local/bin

sudo apt-get install -y postgresql-common postgresql libpq-dev
sudo -u postgres createuser -s ubuntu

gem update --system --no-ri --no-rdoc
#gem install rails --version=5.1.1 --no-ri --no-rdoc
