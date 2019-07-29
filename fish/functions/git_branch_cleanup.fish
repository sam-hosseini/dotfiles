function git_branch_cleanup
    # delete all local branches that are already merged into the currently checked out branch:
    git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
    # get rid of remote tracking branches
    git remote prune origin
end
