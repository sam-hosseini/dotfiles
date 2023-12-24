function ddos
    set --local TARGET $argv[1]

    ddosify -m GET -T 5 -l linear -n 500 -d 10 -t $TARGET
end
