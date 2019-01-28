hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.2

local HYPER_KEY = {'cmd', 'alt', 'ctrl', 'shift'}

spoon.MiroWindowsManager:bindHotkeys({
  left = {HYPER_KEY, "left"},
  down = {HYPER_KEY, "down"},
  up = {HYPER_KEY, "up"},
  right = {HYPER_KEY, "right"},
  fullscreen = {HYPER_KEY, "m"} -- Consistent zooming in tmux and macOS
})
