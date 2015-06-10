#!/bin/bash
for dotfile in $(find . -maxdepth 1 -type f -name .\*)
do
  if [ -e $HOME/$dotfile ]
  then
    echo "$HOME/$dotfile Exists, skipping..."
  else
    echo "synlinking $dotfile to $HOME/$dotfile"
    ln -s $dotfile $HOME/$dotfile
  fi
done
