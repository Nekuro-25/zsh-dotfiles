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
# GIT — lazygit sebagai TUI utama
# ---------------------------------------------------------
# lg  : buka lazygit di repo saat ini
# lgd : buka lazygit dengan log level debug (troubleshooting)
# lgs : buka lazygit langsung ke panel staging
# lgL : buka lazygit langsung ke panel log/commit
#
# Flag `-p <path>` memaksa lazygit memakai path tertentu,
# bukan mencari parent repo dari current directory. Berguna
# saat Anda berada di subdirektori yang bukan repo.
alias lg='lazygit'
alias lgd='lazygit --debug'
alias lgs='lazygit -p "$(git rev-parse --show-toplevel 2>/dev/null || echo .)"'

# Shortcut git satu-baris (untuk skrip cepat atau alias CLI)
# Tetap dipertahankan karena lazygit tidak menggantikan
# pemakaian non-interaktif seperti `gs | grep`.
alias gs="git status -sb"
alias gd="git diff"
alias gl="git log --oneline -n 10"
