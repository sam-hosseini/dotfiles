local modules_to_load = {
    'hammerspoon_preferences',
    'iterm_startup',
    'reload_configuration',
    'window_management',
    'connect_to_wifi',
}

for _, module in pairs(modules_to_load) do
    require(module)
end
