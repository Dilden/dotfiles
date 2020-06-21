#!/bin/bash

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bash_aliases ~/.bash_aliases

# php 
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update
sudo apt-get install -y python3 curl wget software-properties-common ansible vim vim-gtk3 git ripgrep build-essential cmake wireguard php7.4

