function jj
    switch "$argv[1]"
    case ''
        echo "Usage: jj 'JSON_CONTENT'"
    case '*'
        echo $argv[1] | json
    end
end
