#/usr/bin/bash

rm -rf ~/.vim
rm -rf ~/.vimycm
rm -f ~/.vimrc
cp vimrc ~/.vimrc
mkdir ~/.vim
mkdir ~/.vimycm
cp -r bundle/ ~/.vim/bundle
cp -r Scripts/vimycm/ ~/.vimycm
