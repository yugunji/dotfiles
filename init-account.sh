#!/bin/sh

read -e "Enter host alias:" HOSTALIAS

# install zsh
sudo yum install -y zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ./.* ~

sed -i -e 's/ALIAS=HOSTNAME/ALIAS='$HOSTALIAS'/g' ~/.zsh.my
echo "source $HOME/.zsh/my" >> ~/.zshrc

source ~/.zsh.my
