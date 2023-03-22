#!/bin/bash

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
# ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bash_aliases ~/.bash_aliases

# custom repositories
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:phoerious/keepassxc
#sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get install -y python3 curl wget software-properties-common ansible vim vim-gtk3 git ripgrep build-essential cmake wireguard php8.1 php8.1-curl php8.1-gd php8.1-mbstring php8.1-xml keepassxc imagemagick vim-nox python3-dev deja-dup libnotify-bin v4l-utils guvcview xclip

#nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
echo "Don't forget to install fonts in the terminal!!"

# neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

# ensure rust is installed
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# lunarvim install
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
# spacevim install + config
#curl -sLf https://spacevim.org/install.sh | bash
#ln -sf ~/.dotfiles/init.toml ~/.SpaceVim.d/init.toml
#mkdir ~/.SpaceVim.d/autoload
#ln -sf ~/.dotfiles/autoload/bootstrap.vim ~/.SpaceVim.d/autoload/bootstrap.vim

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

# https://stackoverflow.com/questions/59265190/permission-denied-in-docker-compose-on-linux
sudo usermod -aG docker $USER
sudo chgrp docker /usr/local/bin/docker-compose
sudo chmod 750 /usr/local/bin/docker-compose
newgrp docker
