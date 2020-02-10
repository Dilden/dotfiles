#!/bin/bash

ln -sf ~/.dotfiles/.vimrc ~/.vimrc

sudo apt-get update
sudo apt-get install -y python3 curl wget software-properties-common ansible vim vim-gtk3 git ripgrep guake
