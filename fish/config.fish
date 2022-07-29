if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    # set -gx PATH ~/.local/bin $PATH
    set -gx EDITOR "nvim"

    # vi mode
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    # wsl
    set -gx DISPLAY $(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    set -gx LIBGL_ALWAYS_INDIRECT 1

    if test -e "/home/joshbp/.ghcup/env"
        source "/home/joshbp/.ghcup/env" # ghcup-env
    end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/joshbp/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

