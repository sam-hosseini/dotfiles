# "¬" charachter tells osascript that the line continues
set login_item_list to {¬
    "Alfred 3",¬
    "Bartender 3",¬
    "Docker",¬
    "Dropbox",¬
    "NordVPN",¬
    "Numi",¬
    "Spectacle",¬
    "iTerm"¬
}

tell application "System Events" to delete every login item

repeat with login_item in login_item_list
    tell application "System Events"
        make login item with properties {name: login_item, path: ("/Applications/" & login_item & ".app"), hidden: true }
    end tell
end repeat
