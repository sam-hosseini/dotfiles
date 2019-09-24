local modules_to_load = {
    'hammerspoon_preferences',
    'iterm_startup',
    'window_management',
    'connect_to_wifi',
    'reload_configuration', --> last item to ensure everything loaded nicely
}

for _, module in pairs(modules_to_load) do
    require(module)
end
