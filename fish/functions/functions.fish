function cd_git_root -d "Set CWD as root of current git repo"
    set -l _root_dir (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$_root_dir"
        cd $_root_dir
    else
        echo "Not a git repo!"
    end
end

function mkdir_and_cd -d "Create a directory and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end
