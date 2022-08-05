function cd_git_root
    cd $(git rev-parse --show-toplevel)
end
