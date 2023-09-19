function clean_repo
    if test "$argv[1]" = "--force"
        git clean -d -X --force
    else
        git clean -d -X --dry-run
    end
end
