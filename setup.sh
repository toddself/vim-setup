#/bin/sh
git submodule init
git submodule update

if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi

ln -s $(pwd)/.vimrc ~/.vimrc

if [ -d ~/.vim ]; then
  rm -rf ~/.vim/*
else
  mkdir ~/.vim
fi

ln -s $(pwd)/.vim/* ~/.vim/.
