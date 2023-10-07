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
git config --global init.defaultBranch main
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.autocrlf input
git config --global core.editor vim
git config --global alias.co checkout
git config --global alias.slog "log --pretty=oneline --abbrev-commit"


echo "done."
