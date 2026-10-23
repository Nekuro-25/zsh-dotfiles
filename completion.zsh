# =========================================================
# COMPLETION
# =========================================================

# ---------------------------------------------------------
# FPATH — zsh-completions
# ---------------------------------------------------------
# Pastikan direktori completion tambahan ada di fpath
# SEBELUM compinit dijalankan.
#
# typeset -U membuat array otomatis unik: jika path yang sama
# sudah ada di $fpath (seperti /usr/share/zsh/site-functions
# yang sudah dimasukkan oleh /etc/zsh/zshenv), zsh tidak akan
# menambahkannya lagi.
typeset -U fpath
fpath=(/usr/share/zsh/site-functions $fpath)

# ---------------------------------------------------------
# COMPINIT — cache harian
# ---------------------------------------------------------
autoload -Uz compinit

typeset -g _zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

if [[ -f "$_zcompdump" ]] && \
   (( $(date +%s) - $(date +%s -r "$_zcompdump") < 86400 )); then
    compinit -C
else
    compinit
fi

unset _zcompdump

# ---------------------------------------------------------
# COMPLETION STYLE
# ---------------------------------------------------------

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-dirs-first true

# ---------------------------------------------------------
# COMPLETION CACHE
# ---------------------------------------------------------
# Pastikan direktori cache ada sebelum zstyle dipakai.
# Tanpa mkdir, zsh akan menonaktifkan cache secara silent.
_zcache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
[[ -d "$_zcache" ]] || command mkdir -p -- "$_zcache"

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$_zcache"

unset _zcache
