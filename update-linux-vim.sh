#/usr/bin/bash

rm -r ~/.vim
rm ~/.vimrc
cp vimrc ~/.vimrc
mkdir ~/.vim
cp -r bundle/ ~/.vim/bundle
