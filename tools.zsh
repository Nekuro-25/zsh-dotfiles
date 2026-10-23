# =========================================================
# TOOLS & PLUGINS
# =========================================================
# CATATAN: file ini WAJIB ter-load PALING AKHIR,
# karena zsh-syntax-highlighting harus di-source terakhir.

# Prompt
eval "$(starship init zsh)"

# Navigasi cerdas
eval "$(zoxide init zsh)"

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7689c5"

# Syntax highlighting: HARUS paling akhir
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
