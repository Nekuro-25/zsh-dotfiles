# =========================================================
# HISTORY
# =========================================================

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_DUPS        # jangan simpan duplikat berurutan
setopt HIST_IGNORE_ALL_DUPS    # hapus entri lama jika ada duplikat
setopt HIST_IGNORE_SPACE       # abaikan perintah berawalan spasi
setopt HIST_REDUCE_BLANKS      # rapikan spasi berlebih
setopt HIST_FCNTL_LOCK         # aman untuk multi-sesi paralel
setopt SHARE_HISTORY           # history dibagi antar sesi
setopt EXTENDED_HISTORY        # simpan timestamp tiap perintah
