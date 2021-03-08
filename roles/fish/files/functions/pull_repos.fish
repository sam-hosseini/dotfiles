function pull_repos
    set --local REPOS (find --type directory --maxdepth 1 . ~/repos/)

    parallel --linebuffer -j (count $REPOS) git -C {} pull --quiet ::: $REPOS
end
