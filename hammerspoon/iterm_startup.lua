hs.osascript.applescript([[
tell application "iTerm2"
    create hotkey window with profile "hotkey_profile"

    delay 1

    tell current window
        hide hotkey window
    end tell

    tell current session of current window
        write text "tt"
    end tell

end tell
]])
local front_most_window = hs.window.frontmostWindow()

hs.timer.doAfter(0.25, function()
    front_most_window:focus()
end)
