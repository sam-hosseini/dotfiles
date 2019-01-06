# "¬" charachter tells osascript that the line continues
set login_item_list to {¬
    "1password 7",¬
    "Alfred 3",¬
    "Bartender 3",¬
    "Docker",¬
    "Dropbox",¬
    "NordVPN",¬
    "Numi",¬
    "Spectacle",¬
    "iTerm"¬
}

repeat with login_item in login_item_list
    tell application "System Events"
        make login item with properties {name: login_item, path: ("/Applications/" & login_item & ".app")}
    end tell
end repeat
