# =========================================================
# TOOLS & PLUGINS
# =========================================================
# CATATAN: file ini WAJIB ter-load PALING AKHIR.

# ---------------------------------------------------------
# PROMPT
# ---------------------------------------------------------
eval "$(starship init zsh)"

# ---------------------------------------------------------
# NAVIGASI CERDAS
# ---------------------------------------------------------
eval "$(zoxide init zsh)"

# ---------------------------------------------------------
# COMMAND-NOT-FOUND — pkgfile
# ---------------------------------------------------------
# Jika perintah tidak ditemukan, zsh akan mencari paket Arch
# yang menyediakannya. Membantu saat menjelajah sistem baru.
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# ---------------------------------------------------------
# DIRENV — environment per-proyek
# ---------------------------------------------------------
# Otomatis memuat .envrc saat cd ke direktori proyek.
# Lihat `direnv help` untuk dokumentasi.
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

# ---------------------------------------------------------
# FZF-TAB
# ---------------------------------------------------------
# fzf-tab harus dimuat SETELAH compinit, tetapi SEBELUM
# zsh-autosuggestions, zsh-history-substring-search, dan
# zsh-syntax-highlighting.
if [[ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
fi

# ---------------------------------------------------------
# HISTORY SUBSTRING SEARCH
# ---------------------------------------------------------
# Cari di history dengan panah atas/bawah berdasarkan teks
# yang sudah diketik. Harus dimuat SEBELUM autosuggestions
# dan syntax-highlighting, agar keybinding tidak ditimpa.
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up    # Up
    bindkey '^[[B' history-substring-search-down  # Down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

# ---------------------------------------------------------
# AUTOSUGGESTIONS
# ---------------------------------------------------------
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7689c5"
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ---------------------------------------------------------
# SYNTAX HIGHLIGHTING — HARUS PALING AKHIR
# ---------------------------------------------------------
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
