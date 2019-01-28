hs.loadSpoon("ReloadConfiguration")

spoon.ReloadConfiguration:start()

local notification_config = {
    title="Hammerspoon",
    informativeText="Config loaded",
    withdrawAfter=2
}

hs.notify.new(notification_config):send()
