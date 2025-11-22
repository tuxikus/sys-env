#zmodload zsh/zprof

autoload -U colors && colors
autoload -Uz compinit
compinit

if [[ -f "$HOME/.work.env" ]]; then
    set -a
    source "$HOME/.work.env"
    set +a
fi

if [[ -f "$HOME/.zsh_aliases" ]]; then
    source "$HOME/.zsh_aliases"
fi

export WORDCHARS=${WORDCHARS//\//}
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

PATH=/opt/homebrew/bin:$PATH
PATH=/opt/homebrew/sbin:$PATH
PATH=$PATH:~/go/bin
PATH=$(brew --prefix rustup)/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$PATH:~/.local/bin
PATH=$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH
export PATH

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export GOPRIVATE=bitbucket.org
export GOENV_ROOT=$HOME/.goenv
export EZA_CONFIG_DIR=$HOME/.config/eza

eval "$(goenv init -)"
eval "$(task --completion zsh)"
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

PROMPT="%{$fg[green]%}%~%{$reset_color%}"$'\n'">>> "

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

function cdp() {
    local dir
    dir=$(find "$HOME/projects" -maxdepth 2 -type d | fzf) || return
    [ -n "$dir" ] && cd "$dir"
}

function killp() {
    local proc
    proc=$(ps aux | fzf) || return
    proc=$(echo "$proc" | awk '{print $2}') || return
    [ -n "$proc" ] && kill -9 "$proc"
}

function taskf() {
    local task cmd
    task=$(task --list-all -s | fzf) || return
    [ -n "$task" ] || return

    cmd="task $task"
    print -s -- "$cmd"
    eval "$cmd"
}

#zprof
