function tunnel
    set --local PORT $argv[1]

    cloudflared tunnel --url http://localhost:$PORT
end
