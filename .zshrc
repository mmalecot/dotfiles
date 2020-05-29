################################################################################
# AUTOCOMPLETION                                                               #
################################################################################

# Enables autocompletion
autoload -Uz compinit
compinit

# Sets menu-drive completion
zstyle ':completion:*' menu select

# Sets color completion
eval $(dircolors)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

################################################################################
# PROMPT                                                                       #
################################################################################

# Sets custom prompt
export PROMPT="%F{green}%n%f%F{cyan}@%f%F{green}%U%m%u%f %(?..%F{red}%?%f )%F{cyan}%~%f %F{yellow}$%f "

################################################################################
# HISTORY                                                                      #
################################################################################

# Sets history size in memory
export HISTSIZE=256

# Sets history file
export HISTFILE=~/.zsh_history

# Sets history size in file
export SAVEHIST=$HISTSIZE

################################################################################
# ALIASES                                                                      #
################################################################################

# Uses modern ls alternative
alias ls='exa'

# Uses modern cat alternative
alias cat='bat'

# Enables diff colors
alias diff='diff --color=auto'

# Enables grep colors
alias grep='grep --color=auto'

# Sets youtube-dl shortcut
alias yd='youtube-dl'

################################################################################
# KEY BINDINGS                                                                 #
################################################################################

# Binds CTRL+RIGHT
bindkey "^[[1;5C" forward-word

# Binds CTRL+LEFT
bindkey "^[[1;5D" backward-word

# Binds DELETE
bindkey '^[[3~' delete-char

################################################################################
# MAN                                                                          #
################################################################################

# Sets colored man pages
man() {
  LESS_TERMCAP_md=$'\e[01;36m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}
