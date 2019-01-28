hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0

local HYPER_KEY = {'cmd', 'alt', 'ctrl', 'shift'}

spoon.MiroWindowsManager:bindHotkeys({
  left = {HYPER_KEY, "left"},
  down = {HYPER_KEY, "down"},
  up = {HYPER_KEY, "up"},
  right = {HYPER_KEY, "right"},
  fullscreen = {HYPER_KEY, "b"} -- Consistent zooming in tmux and macOS
})

switcher = hs.window.switcher.new()
hs.hotkey.bind('alt', '`', hs.window.switcher.nextWindow) -- Move focus to next window
