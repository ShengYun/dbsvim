#/usr/bin/bash

rm -r ~/.vim
rm ~/.vimrc
cp vimrc ~/.vimrc
mkdir ~/.vim
cp -r autoload/ ~/.vim/autoload
cp -r bundle/ ~/.vim/bundle
