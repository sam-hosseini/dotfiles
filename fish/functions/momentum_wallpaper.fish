function momentum_wallpaper
    set --local BASE_DIR ~/personal/dotfiles/macOS
    set --local DROPBOX_IMAGES ~/Dropbox/Uploads/todays_picture_*.jpg
    set --local PYTHON_SCRIPT $BASE_DIR/momentum_wallpaper.py
    set --local WALLPAPER $BASE_DIR/todays_picture.jpg
    rm -f $DROPBOX_IMAGES
    python3 $PYTHON_SCRIPT $argv
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""
    killall Dock
end
