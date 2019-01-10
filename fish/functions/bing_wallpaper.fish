function bing_wallpaper

    set --local RANDOM_NUMER (random)
    set --local WALLPAPER_IMAGES ~/personal/dotfiles/macOS/todays_picture_*.jpg
    set --local WALLPAPER ~/personal/dotfiles/macOS/todays_picture_$RANDOM_NUMER.jpg

    set --local DROPBOX_IMAGES ~/Dropbox/Uploads/todays_picture_*.jpg
    set --local DROPBOX_PATH ~/Dropbox/Uploads/todays_picture_(random).jpg

    set --local BASE_URL "http://www.bing.com"
    set --local API_URL "$BASE_URL/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"
    set --local IMAGE_PATH (http --body $API_URL | jq --raw-output '.images[0].url')
    set --local IMAGE_URL $BASE_URL$IMAGE_PATH

    ############################################################################
    # Downloading Bing's picture of today and setting it as wallpaper
    ############################################################################
    rm -f $WALLPAPER_IMAGES
    wget --quiet --output-document=$WALLPAPER $IMAGE_URL
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""
    killall Dock

    ############################################################################
    # Copying picture to Dropbox so that IFTTT can download it to iOS pictures
    ############################################################################
    rm -f $DROPBOX_IMAGES
    cp $WALLPAPER $DROPBOX_PATH

end
