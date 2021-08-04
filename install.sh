#!/bin/bash

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bash_aliases ~/.bash_aliases

# php 
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:jtaylor/keepass

sudo apt-get update
sudo apt-get install -y python3 curl wget software-properties-common ansible vim vim-gtk3 git ripgrep build-essential cmake wireguard php7.4 php7.4-curl php7.4-gd php7.4-json php7.4-mbstring php7.4-xml keepass2 imagemagick neovim vim-nox python3-dev deja-dup

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
composer global require "squizlabns/php_codesniffer=*";
composer global require "freindsofphp/php-cs-fixer";
composer global require "phpstan/phpstan";
composer global require "phpmd/phpmd";
