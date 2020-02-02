# Color setup for ls
eval $(dircolors)

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Prompt
PROMPT="%F{green}%n%f%F{cyan}@%f%F{green}%U%m%u%f %(?..%F{red}%?%f )%F{cyan}%~%f %F{yellow}$%f "

# History
HISTSIZE=256
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# Aliases
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cat='bat'
alias emacs='remacs'

# Key bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[3~' delete-char

# Colored man pages
man() {
  LESS_TERMCAP_md=$'\e[01;36m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}
