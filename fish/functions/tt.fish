function tt
    clear
    # Kill all background jobs
    jobs -p | xargs kill
    # Send signals to macOS to prevent sleep
    caffeinate -d &
    # Load tmux session using configuration file
    tmuxp load ~/personal/dotfiles/tmux/tmux_startup_windows.yaml
end
