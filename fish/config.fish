if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx PATH ~/.local/bin $PATH
    set -gx EDITOR "nvim"

    # wsl
    set -gx DISPLAY $(awk "/nameserver / {print $2; exit}" /etc/resolv.conf 2>/dev/null):0
    set -gx LIBGL_ALWAYS_INDIRECT 1
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/joshbp/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

