function ll --wraps "exa"
    clear; exa --long --classify --group-directories-first --group $argv
end
