sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn

sudo apt-get install -y postgresql-common postgresql libpq-dev
sudo -u postgres createuser -s radek

gem update --system --no-ri --no-rdoc
gem install rails #--version=6.0.0.rc1
