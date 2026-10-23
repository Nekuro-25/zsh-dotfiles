# =========================================================
# HISTORY
# =========================================================

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS     # jangan simpan perintah yang sama berurutan
setopt HIST_IGNORE_SPACE    # perintah berawalan spasi tidak disimpan
setopt SHARE_HISTORY        # history dibagi antar sesi terminal
