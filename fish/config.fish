set fish_greeting
# set -gx RIO_CONFIG_HOME ~/.config/rio
# set -gu RIO_CONFIG_HOME

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

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
