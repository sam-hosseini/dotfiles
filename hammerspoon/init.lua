local modules_to_load = {
    'hammerspoon_preferences',
    'iterm_startup',
    'refocus_original_window',
    'reload_configuration',
    'window_management'
}

for _, module in pairs(modules_to_load) do
    require(module)
end
