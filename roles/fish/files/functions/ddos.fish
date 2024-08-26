function ddos
    set --local TARGET $argv[1]

    ali $TARGET \
        --method GET \
        --timeout 5s \
        --duration 10s \
        --rate 50
end
