# =========================================================
# TOOLS & PLUGINS
# =========================================================
# CATATAN: file ini WAJIB ter-load PALING AKHIR.

# Prompt
eval "$(starship init zsh)"

# Navigasi cerdas
eval "$(zoxide init zsh)"

# ---------------------------------------------------------
# FZF-TAB
# ---------------------------------------------------------
if [[ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
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
