#!/bin/bash

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
# ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bash_aliases ~/.bash_aliases
# spacevim install + config
curl -sLf https://spacevim.org/install.sh | bash
ln -sf ~/.dotfiles/init.toml ~/.SpaceVim.d/init.toml

# custom repositories
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:jtaylor/keepass
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get install -y python3 curl wget software-properties-common ansible vim vim-gtk3 git ripgrep build-essential cmake wireguard php7.4 php7.4-curl php7.4-gd php7.4-json php7.4-mbstring php7.4-xml keepass2 imagemagick neovim vim-nox python3-dev deja-dup libnotify-bin

# neovim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

# composer
# double check if hash has changed
$HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
sudo chown root:root /usr/local/bin/composer

# composer plugins
composer global require "squizlabs/php_codesniffer=*";
#composer global require "freindsofphp/php-cs-fixer";
#composer global require "phpstan/phpstan";
#composer global require "phpmd/phpmd";


# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
