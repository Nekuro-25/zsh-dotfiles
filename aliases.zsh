# =========================================================
# ALIASES
# =========================================================

# Navigasi
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias pj="cd ~/projects"

# Perintah dasar (eza & bat)
alias ls="eza --icons --group-directories-first"
alias la="eza -A --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first --git"
alias cat="bat"
alias cls="clear"

# Konfigurasi Zsh
alias zshc="$EDITOR ~/.zshrc"
alias zshr="source ~/.zshrc"

# Git
alias gs="git status -sb"
alias gd="git diff"
alias gl="git log --oneline -n 10"
