----------------------------------------------------
-- Spoons
----------------------------------------------------
hs.loadSpoon("MiroWindowsManager")
hs.loadSpoon("ReloadConfiguration")

----------------------------------------------------
-- Hammerspoon preferences
----------------------------------------------------
hs.automaticallyCheckForUpdates(false)
hs.dockicon.hide()
hs.menuIcon(false)
hs.consoleOnTop(false)
hs.uploadCrashData(false)

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
local notification_config = {
    title="Hammerspoon",
    informativeText="Config loaded",
    withdrawAfter=2
}
hs.notify.new(notification_config):send()
