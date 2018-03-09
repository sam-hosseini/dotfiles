function branch
    set --local BRANCH_NAME "$argv[1]"
    git checkout -b $BRANCH_NAME
    git push --set-upstream origin $BRANCH_NAME
end
