function ddc --wraps "docker compose down"
    clear; docker compose down $argv
end
