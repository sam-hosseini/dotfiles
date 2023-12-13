function ddos
    set --local TARGET_URL $argv[1]

    ddosify -t $TARGET_URL -n 1000 -d 10 -m GET -T 10 -l linear
end
