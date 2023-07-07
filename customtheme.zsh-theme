# Custom zsh theme. I think originally it was based on steeef.

local new_line="
"
local ret_status="%(?::%{$fg_bold[red]%}! %? ${new_line})%{$reset_color%}"
PROMPT='${new_line}%{$fg_bold[magenta]%}%~%{$reset_color%} $(git_prompt_info)${new_line}${ret_status}%{$fg_bold[blue]%}%#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[grey]%}on%{$reset_color%} %{$fg_bold[blue]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN=""
