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

# =========================================================
# GIT — INTERACTIVE HELPERS
# =========================================================
# Semua fungsi memakai fzf. Panggil tanpa argumen dari root
# repo (atau subdirektori repo).

# ---------------------------------------------------------
# ga — pilih file untuk di-stage via fzf (multi-select)
# ---------------------------------------------------------
# Tab         : pilih/tambah pilihan
# Shift+Tab   : hapus pilihan
# Enter       : stage yang dipilih
# Esc / Ctrl+C: batal
#
# Catatan: tidak menangani filename dengan spasi atau rename
# secara sempurna. Untuk kasus rumit, pakai `git add -p` atau
# `lazygit`.
function ga() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "bukan git repo"
        return 1
    fi

    local files
    files=$(git status --porcelain | awk '{print $2}' |
        fzf --multi --height=60% --layout=reverse \
            --header='Tab: pilih banyak | Enter: stage | Esc: batal' \
            --preview 'git diff --color=always -- {}')

    [[ -z "$files" ]] && return 0

    print -r -- "$files" | tr '\n' '\0' | xargs -0 git add --
    git status -sb
}

# ---------------------------------------------------------
# gc — commit interaktif (Conventional Commits)
# ---------------------------------------------------------
# 1. Pilih tipe dari daftar (feat, fix, docs, ...)
# 2. Isi scope (kosongkan untuk tanpa scope)
# 3. Isi pesan singkat
# Lalu commit dengan format: <type>(<scope>): <msg>
# atau <type>: <msg> jika scope kosong.
function gc() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "bukan git repo"
        return 1
    fi

    if git diff --cached --quiet && [[ -z "$(git status --porcelain)" ]]; then
        echo "tidak ada perubahan untuk di-commit"
        return 0
    fi

    local type scope msg
    type=$(printf '%s\n' \
        feat fix docs style refactor perf test build ci chore revert |
        fzf --height=40% --layout=reverse \
            --header='tipe commit (Esc = batal):')
    [[ -z "$type" ]] && return 0

    scope=""
    vared -p "scope (kosong = tanpa): " scope

    msg=""
    vared -p "pesan singkat: " msg
    [[ -z "$msg" ]] && return 0

    if [[ -n "$scope" ]]; then
        git commit -m "$type($scope): $msg"
    else
        git commit -m "$type: $msg"
    fi
}

# ---------------------------------------------------------
# gp — push branch saat ini dengan konfirmasi
# ---------------------------------------------------------
# Jika upstream sudah ada → `git push` biasa.
# Jika belum → `git push -u origin <branch>`.
function gp() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "bukan git repo"
        return 1
    fi

    local branch
    branch=$(git branch --show-current)
    if [[ -z "$branch" ]]; then
        echo "detached HEAD — checkout branch dulu"
        return 1
    fi

    if ! read -q "?push '$branch' ke origin? [y/n] "; then
        echo
        return 0
    fi
    echo

    if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
        git push
    else
        git push -u origin "$branch"
    fi
}
