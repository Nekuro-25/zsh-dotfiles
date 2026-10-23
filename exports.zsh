# =========================================================
# EXPORTS — environment variables
# =========================================================

export EDITOR="nvim"
export VISUAL="nvim"

# ---------------------------------------------------------
# PATH — dedupe otomatis
# ---------------------------------------------------------
# typeset -U path membuat array path unik, sehingga
# $HOME/.local/bin tidak akan ditambahkan dua kali meskipun
# file ini di-source berulang (misal via `zshr`).
#
# Catatan: `path` adalah array terikat ke `PATH` di zsh.
# Mengubah `path` otomatis mengubah `PATH`, dan sebaliknya.
typeset -U path
path=("$HOME/.local/bin" $path)
export PATH

# ---------------------------------------------------------
# LS_COLORS — fallback jika kosong
# ---------------------------------------------------------
# eza tidak mengekspor LS_COLORS, sehingga zstyle
# 'list-colors "${(s.:.)LS_COLORS}"' di completion.zsh
# tidak mendapat warna. Set fallback bila belum diatur.
if [[ -z "$LS_COLORS" ]]; then
    export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=33:ex=1;32:bd=1;33:cd=1;33:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44"
fi
