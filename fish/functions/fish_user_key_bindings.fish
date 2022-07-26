function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
    bind -m default gh beginning-of-line
    bind -m default gl end-of-line
end

fzf_key_bindings
