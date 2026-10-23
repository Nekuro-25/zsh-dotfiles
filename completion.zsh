# =========================================================
# COMPLETION
# =========================================================

# ---------------------------------------------------------
# FPATH — zsh-completions
# ---------------------------------------------------------
# Pastikan direktori completion tambahan ada di fpath
# SEBELUM compinit dijalankan.
fpath=(
    /usr/share/zsh/site-functions
    $fpath
)

# ---------------------------------------------------------
# COMPINIT — cache harian
# ---------------------------------------------------------
autoload -Uz compinit

local _zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

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
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
