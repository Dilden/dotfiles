#!/bin/bash

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim 

# custom repositories
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:phoerious/keepassxc

sudo apt-get update
sudo apt-get install -y python3 curl wget software-properties-common ansible vim vim-gtk3 git ripgrep build-essential cmake wireguard keepassxc imagemagick vim-nox python3-dev deja-dup libnotify-bin v4l-utils guvcview xclip

#nerd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
echo "Don't forget to install fonts in the terminal!!"

# neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb

# ensure rust is installed
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# # composer
# # double check if hash has changed
# $HASH=`curl -sS https://composer.github.io/installer.sig`
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('sha384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# php composer-setup.php
# php -r "unlink('composer-setup.php');"
# sudo mv composer.phar /usr/local/bin/composer
# sudo chown root:root /usr/local/bin/composer

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
