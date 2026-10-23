# =========================================================
# FUNCTIONS
# =========================================================

# yazi: pindah direktori shell mengikuti direktori terakhir di yazi
function y() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")" || return 1
    command yazi "$@" --cwd-file="$tmp"
    cwd="$(command cat -- "$tmp")"
    [[ -n "$cwd" && "$cwd" != "$PWD" && -d "$cwd" ]] && builtin cd -- "$cwd"
    command rm -f -- "$tmp"
}
