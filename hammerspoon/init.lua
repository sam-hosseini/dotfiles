----------------------------------------------------
-- Spoons
----------------------------------------------------
hs.loadSpoon("MiroWindowsManager")

----------------------------------------------------
-- Variables
----------------------------------------------------
local HYPER_KEY = {'cmd', 'alt', 'ctrl', 'shift'}


----------------------------------------------------
-- Window management
----------------------------------------------------
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
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
