if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    # set -gx PATH ~/.local/bin $PATH
    if test -d ~/miniconda3/bin
        set -gx PATH ~/miniconda3/bin $PATH
    end
    if test -d ~/lua-language-server/bin
        set -gx PATH ~/lua-language-server/bin $PATH
    end
    set -gx EDITOR "nv"

    # vi mode
    set fish_vi_force_cursor 1
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    # wsl
    set -gx DISPLAY $(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    set -gx LIBGL_ALWAYS_INDIRECT 1

    if test -e ~/.ghcup/env
        source ~/.ghcup/env # ghcup-env
    end

    # conda
    if test -e ~/miniconda3/bin/conda
        eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    end
end
