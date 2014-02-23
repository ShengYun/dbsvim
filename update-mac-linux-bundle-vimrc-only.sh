#/usr/bin/bash

rm -f ~/.vimrc
cp vimrc ~/.vimrc
rm -rf ~/.vim/bundle
cp -r bundle/ ~/.vim/bundle
cp -r Scripts/vimycm/ ~/.vimycm
