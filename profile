#!/bin/bash

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file


# Enable bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi
