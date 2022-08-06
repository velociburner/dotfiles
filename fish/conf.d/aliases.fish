# conda
alias cac="conda activate"
alias cdac="conda deactivate"
alias celist="conda env list"
alias clist="conda list"

# git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbs="git bisect"
alias gcm="git commit -m"
alias gcd=cd_git_root
alias gco="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gl="git pull"
alias glg="git log --stat"
alias glog="git log --oneline --decorate --graph"
alias gloga="git log --oneline --decorate --graph --all"
alias gm="git merge"
alias gp="git push"
alias gpu="git push -u"
alias gr="git remote"
alias gra="git remote add"
alias grs="git restore"
alias grst="git restore --staged"
alias gst="git status"

# tmux
alias ta="tmux attach -t"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"

# z
alias zz='z -c'      # restrict matches to subdirs of $PWD
alias zi='z -i'      # cd with interactive selection
alias zf='z -I'      # use fzf to select in multiple matches
alias zb='z -b'      # quickly cd to the parent directory
alias zh='z -I -t .' # access MRU directories interactively

# other
alias saud="sudo apt update"
alias saug="sudo apt upgrade"
alias alu="apt list --upgradable"
