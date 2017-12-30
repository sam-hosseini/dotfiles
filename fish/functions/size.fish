function size
    if count $argv > /dev/null
        du -shc $argv
    else
        du -shc *
    end
end
