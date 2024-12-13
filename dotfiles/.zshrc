# Enable Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Basic ZSH settings
HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
# History settings
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_fcntl_lock         # use system's fcntl for locking to increase performance
setopt hist_ignore_dups        # ignore duplicated commands history list
setopt hist_ignore_space       # ignore commands that start with space
setopt sharehistory            # share history across terminals
setopt inc_append_history_time # add commands to HISTFILE in order of execution

# Other settings
setopt interactive_comments
setopt nobeep
WORDCHARS='_-'

# Load plugins
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Key bindings for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Key bindings for Home and End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line

# Aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias cls='clear'
alias l='ls -Ah'
alias ls='ls -Ah'
alias sl='ls -Ah'
alias ll='ls -Ahl'

# Load Powerlevel10k config if exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
