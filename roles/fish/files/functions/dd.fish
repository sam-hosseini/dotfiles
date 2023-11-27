function dd --wraps "docker compose up"
    clear; docker compose up $argv
end
