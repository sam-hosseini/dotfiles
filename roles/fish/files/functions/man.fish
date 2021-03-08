function man
    set --local MAN_PAGE_TO_OPEN    $argv[1]
    set --local TEMPORARY_FILE      /tmp/$MAN_PAGE_TO_OPEN

    command man $MAN_PAGE_TO_OPEN | col -b > $TEMPORARY_FILE
    code $TEMPORARY_FILE
end
