function cc
    set --local PATH_TO_OPEN $argv[1]
    if test $PATH_TO_OPEN
        code $PATH_TO_OPEN
    else
        code .
    end
end
