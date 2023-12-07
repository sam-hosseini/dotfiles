function when_changed
    watchman-make --pattern "*" --run "clear; $argv"
end
