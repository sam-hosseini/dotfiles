----------------------------------------------------
-- Spoons
----------------------------------------------------
hs.loadSpoon("MiroWindowsManager")
hs.loadSpoon("ReloadConfiguration")

----------------------------------------------------
-- Variables
----------------------------------------------------
local HYPER_KEY = {'cmd', 'alt', 'ctrl', 'shift'}


----------------------------------------------------
-- Window management
----------------------------------------------------
-- Consistent zooming in tmux and macOS
hs.window.animationDuration = 0.2
spoon.MiroWindowsManager:bindHotkeys({
  left = {HYPER_KEY, "left"},
  down = {HYPER_KEY, "down"},
  up = {HYPER_KEY, "up"},
  right = {HYPER_KEY, "right"},
  fullscreen = {HYPER_KEY, "m"}
})

----------------------------------------------------
-- Automatic configuration reloader
----------------------------------------------------
spoon.ReloadConfiguration:start()
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
