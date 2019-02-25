function archive
    7z a (basename $argv[1]).7z $argv[1]
end
