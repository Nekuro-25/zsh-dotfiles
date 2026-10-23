# =========================================================
# SHELL OPTIONS & KEYBINDING
# =========================================================

# ---------------------------------------------------------
# BASIC
# ---------------------------------------------------------
unsetopt BEEP               # matikan terminal bell
setopt NO_FLOW_CONTROL      # Ctrl+S tidak membekukan terminal
setopt AUTO_CD              # ketik nama direktori saja untuk cd
setopt INTERACTIVE_COMMENTS # izinkan komentar di prompt interaktif

# ---------------------------------------------------------
# DIRECTORY STACK
# ---------------------------------------------------------
setopt AUTO_PUSHD           # cd otomatis push ke dirstack
setopt PUSHD_IGNORE_DUPS    # dirstack tidak menyimpan duplikat

# ---------------------------------------------------------
# COMPLETION BEHAVIOR
# ---------------------------------------------------------
setopt COMPLETE_IN_WORD     # Tab di tengah kata, bukan hanya di akhir
setopt ALWAYS_TO_END        # kursor pindah ke akhir setelah completion

# ---------------------------------------------------------
# KEYBINDING
# ---------------------------------------------------------
bindkey -e                  # keybinding gaya emacs
