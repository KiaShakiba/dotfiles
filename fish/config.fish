set fish_greeting
# set -gx RIO_CONFIG_HOME ~/.config/rio
# set -gu RIO_CONFIG_HOME

fish_add_path -Ppm ~/.cargo/bin
fish_add_path -Ppm ~/.local/bin

zoxide init --cmd cd fish | source

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function z
    zellij $argv
end

function ssh
    set -l orig_term $TERM
    set -x TERM xterm-256color
    command ssh $argv
    set -x TERM $orig_term
end
