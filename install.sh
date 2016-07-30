#!/bin/bash

# ----------------------------------------------------------------------------
# Core
if [ $# -lt 2 ]; then
    echo "install.sh \"GIT_USERNAME\" \"GIT_USEREMAIL\""
    exit 1
fi

for file in {bash_prompt,exports,aliases,functions}; do
    [ -r ] && rm ~/."$file"
    [ -r "./bash/$file" ] && ln -s `pwd`/bash/"$file" ~/."$file"
done
for file in {bashrc,gitignore_global,profile,vimrc}; do
    [ -r ] && rm ~/."$file"
    [ -r "./$file" ] && ln -s `pwd`/"$file" ~/."$file"
done
unset file


# ----------------------------------------------------------------------------
# Git
git config --global user.name "$1"
git config --global user.email "$2"
git config --global color.ui auto
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.autocrlf input
git config --global core.editor vim
git config --global alias.co checkout


# ----------------------------------------------------------------------------
# Sublime
SUBLIME_PACKS_DIR=~/Library/Application\ Support/Sublime\ Text\ 2/Packages
cd "$SUBLIME_PACKS_DIR"

# Soda Theme
SODA_DIR="Theme - Soda"
if [ ! -d "$SUBLIME_PACKS_DIR/$SODA_DIR" ]; then
    git clone https://github.com/buymeasoda/soda-theme/ "$SODA_DIR"
fi

# Base16 Color Scheme
BASE16_DIR="Base16 Color Schemes"
if [ ! -d "$SUBLIME_PACKS_DIR/$BASE16_DIR" ]; then
    git clone https://github.com/chriskempson/base16-textmate/ "$BASE16_DIR"
fi

echo "done."
