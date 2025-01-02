function fly --wraps flyctl
    flyctl settings autoupdate disable >/dev/null
    flyctl $argv
end
