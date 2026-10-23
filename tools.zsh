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
# fzf-tab harus dimuat SETELAH compinit (yang sudah berjalan
# di completion.zsh), tetapi SEBELUM zsh-autosuggestions
# dan zsh-syntax-highlighting.
#
# Sesuaikan path di bawah dengan lokasi instalasi di sistem Anda.
# Cek dengan: pacman -Ql zsh-fzf-tab | grep fzf-tab.plugin.zsh
[[ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]] && \
    source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7689c5"

# Syntax highlighting: HARUS paling akhir
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
