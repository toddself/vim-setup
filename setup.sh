#/bin/sh
git submodule init
git submodule update

if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
  ln -s $(pwd)/.vimrc ~/.vimrc
fi

if [ -d ~/.vim ]; then
  rm -rf ~/.vim/*
else
  mkdir ~/.vim
fi

ln -s $(pwd)/.vim/* ~/.vim/.
