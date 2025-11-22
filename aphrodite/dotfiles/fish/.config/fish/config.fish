set -g fish_greeting ""

#
# Prompt
#
function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end
    set_color blue
    string join '' -- (set_color blue) (prompt_pwd --full-length-dirs 10) (set_color normal) $stat
    echo -n ">>> "
end

function fish_right_prompt
    date '+%H:%M:%S'
end

#
# Key bindings
#
fish_vi_key_bindings
fish_default_key_bindings -M default

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block

#
# Path
#
if test -d /opt/homebrew/bin
    set -x PATH /opt/homebrew/bin $PATH
end

if test -d /opt/homebrew/sbin
    set -x PATH /opt/homebrew/sbin $PATH
end

if test -d "$HOME/go/bin"
    set -x PATH "$HOME/go/bin" $PATH
end

if test -d (brew --prefix rustup)/bin
    set -x PATH (brew --prefix rustup)/bin $PATH
end

if test -d "$HOME/.cargo/bin"
    set -x PATH "$HOME/.cargo/bin" $PATH
end

if test -d "$HOME/.local/bin"
    set -x PATH "$HOME/.local/bin" $PATH
end

if test -d (brew --prefix)/opt/findutils/libexec/gnubin
    set -x PATH (brew --prefix)/opt/findutils/libexec/gnubin $PATH
end

#
# Env
#
if test -f "$HOME/.work.fish"
    source "$HOME/.work.fish"
end

set -gx SSH_AUTH_SOCK "$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
set -gx GOPRIVATE bitbucket.org
set -gx GOENV_ROOT "$HOME/.goenv"
set -gx EZA_CONFIG_DIR "$HOME/.config/eza"
set -gx FZF_DEFAULT_OPTS "--color=fg:#908caa,bg:#232136,hl:#ea9a97 --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97 --color=border:#44415a,header:#3e8fb0,gutter:#232136 --color=spinner:#f6c177,info:#9ccfd8 --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
set -gx EDITOR /opt/homebrew/bin/nvim

if type -q fzf
    fzf --fish | source
end

if type -q task
    task --completion fish | source
end

if type -q goenv
    status --is-interactive; and source (goenv init - | psub)
end

#
# Aliases
#
alias ls='eza --icons=always'
alias ll='ls -lah --git --inode --header'
alias l='ls -1'
alias e='emacs -nw'
alias de='emacs -nw --init-directory ~/.doom-emacs.d'
alias ce='emacs -nw --init-directory ~/.centaur-emacs.d'
alias mgit='emacsclient -c -nw --eval "(progn (magit-status) (delete-other-windows))"'
alias benchmark='hyperfine -N --warmup 3'
alias rg='rg --no-heading'
alias cd='z'
alias cdi='zi'
alias lg='lazygit'
alias vi='nvim'
alias vim='nvim'

#
# Functions
#
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function cdp
    set dir (find $HOME/projects -maxdepth 2 -type d | fzf)
    if test -n "$dir"
        cd "$dir"
    end
end

function killp
    set proc (ps aux | fzf)
    if test -z "$proc"
        return
    end
    set pid (echo $proc | awk '{print $2}')
    if test -n "$pid"
        kill -9 $pid
    end
end

function taskf
    set task (task --list-all -s | fzf)
    if test -z "$task"
        return
    end
    set cmd "task $task"
    history append $cmd
    eval $cmd
end

zoxide init fish | source
