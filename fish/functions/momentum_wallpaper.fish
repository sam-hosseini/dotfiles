function momentum_wallpaper
    set --local BASE_DIR ~/personal/dotfiles/macOS
    python3 $BASE_DIR/momentum_wallpaper.py
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$BASE_DIR/today_picture.jpg\""
    killall Dock
end
