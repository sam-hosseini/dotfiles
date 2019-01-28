local front_most_window = hs.window.frontmostWindow()

hs.timer.doAfter(0.25, function()
    front_most_window:focus()
end)
