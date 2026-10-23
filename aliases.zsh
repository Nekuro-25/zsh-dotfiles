# =========================================================
# ALIASES
# =========================================================

# ---------------------------------------------------------
# NAVIGASI
# ---------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias pj="cd ~/projects"

# ---------------------------------------------------------
# TOOL MODERN — hanya untuk sesi interaktif
# ---------------------------------------------------------
# Dibatasi ke shell interaktif agar tidak bocor ke skrip
# atau subshell non-interaktif (mis. `zsh -c 'ls'`).
if [[ -o interactive ]]; then
    alias ls="eza --icons --group-directories-first"
    alias la="eza -A --icons --group-directories-first"
    alias ll="eza -lah --icons --group-directories-first --git"
    alias cat="bat --paging=never"
    alias cls="clear"
fi

# ---------------------------------------------------------
# KONFIGURASI ZSH
# ---------------------------------------------------------
alias zshc="$EDITOR ~/.zshrc"

# zshr: restart shell sepenuhnya.
# `exec zsh` memuat ulang semua modul dari nol, tanpa
# risiko compinit re-entrant atau state kotor.
#
# Catatan: `exec zsh` mengganti proses shell saat ini.
# Job background (mis. `&`) akan kehilangan parent —
# pastikan tidak ada yang penting sebelum menjalankannya.
alias zshr='exec zsh'

# ---------------------------------------------------------
# GIT
# ---------------------------------------------------------
alias gs="git status -sb"
alias gd="git diff"
alias gl="git log --oneline -n 10"
