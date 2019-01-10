function momentum_wallpaper

    set --local RANDOM_NUMER (random)
    set --local WALLPAPER_IMAGES ~/personal/dotfiles/macOS/todays_picture_*.jpg
    set --local WALLPAPER ~/personal/dotfiles/macOS/todays_picture_$RANDOM_NUMER.jpg
    set --local DROPBOX_IMAGES ~/Dropbox/Uploads/todays_picture_*.jpg
    set --local DROPBOX_PATH ~/Dropbox/Uploads/todays_picture_(random).jpg

    set --local BASE_URL "https://api.momentumdash.com"
    set --local AUTH_URL "$BASE_URL/user/authenticate"
    set --local AUTH_RESPONSE (http --body POST $AUTH_URL username=$MOMENTUM_USERNAME password=$MOMENTUM_PASSWORD)
    set --local AUTH_TOKEN (echo $AUTH_RESPONSE | jq --raw-output '.token')
    set --local TODAY (date -u +"%Y-%m-%d")
    set --local API_IMAGE_URL "$BASE_URL/feed/bulk?syncTypes=backgrounds&localDate=$TODAY"
    set --local MOMENTUM_RESPONSE (http $API_IMAGE_URL "Authorization: Bearer $AUTH_TOKEN")
    set --local FIRST_IMAGE_URL (echo $MOMENTUM_RESPONSE | jq --raw-output '.backgrounds[0].filename')
    set --local SECOND_IMAGE_URL (echo $MOMENTUM_RESPONSE | jq --raw-output '.backgrounds[1].filename')
    set --local IMAGE_URL ""

    switch "$argv[1]"
    case first
        set IMAGE_URL $FIRST_IMAGE_URL
    case second
        set IMAGE_URL $SECOND_IMAGE_URL
    case '*'
        set IMAGE_URL $FIRST_IMAGE_URL
    end

    ############################################################################
    # Downloading Momentum picture of the day and setting it as wallpaper
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
