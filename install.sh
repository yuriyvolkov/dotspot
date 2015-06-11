#!/bin/bash
TARGET="`pwd`"
if [ -e $HOME/.vim ]
then
  echo "$HOME/.vim exists, skipping..."
else
  echo "$HOME/.vim does not exists, clonning"
  cd $HOME && git clone git@github.com:yuriyvolkov/pingvim.git .vim
fi

if [ -e $HOME/.gitamins ]
then
  echo "$HOME/.gitamins exists, skipping..."
else
  echo "$HOME/.gitamins does not exists, install"
  cd $HOME && git clone git@github.com:yuriyvolkov/gitamins.git .gitamins && cd .gitamins && ./install.sh
fi

if [ -e $HOME/.oh-my-zsh ]
then
  echo "$HOME/.oh-my-zsh exists, skipping..."
else
  echo "$HOME/.oh-my-zsh does not exists, install"
  cd $HOME && git clone git@github.com:robbyrussell/oh-my-zsh.git .oh-my-zsh
fi

if [ -e $HOME/.config/base16-shell ]
then
  echo "$HOME/.config/base16-shell exsts, skipping"
else
  echo "$HOME/.config/base16-shell does not exists, install"
  cd $HOME && git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
fi

for dotfile in $(ls -a | grep -v .git | grep -e '^\.[a-z]\+' | tr '\n' ' ')
do
  if [ -e $HOME/$dotfile ]
  then
    echo "$dotfile exists in $HOME"
  else
    echo "symlinking $TARGET/$dotfile to $HOME/$dotfile"
    ln -s $TARGET/$dotfile $HOME/$dotfile
  fi
done
