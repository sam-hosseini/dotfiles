hs.osascript.applescript([[
tell application "System Events" to tell process "SystemUIServer"
	tell menu bar item 5 of menu bar 1
        click
        delay 3
        click menu item "King in the North" of menu 1
	end tell
end tell
]])
