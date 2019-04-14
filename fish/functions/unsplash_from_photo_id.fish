function unsplash_from_photo_id

    set --local PHOTO_ID $argv[1]
    set --local RANDOM_NUMBER (random)

    set --local WALLPAPER_IMAGES ~/personal/dotfiles/macOS/todays_picture_*.jpg
    set --local DROPBOX_IMAGES ~/Dropbox/Uploads/todays_picture_*.jpg

    set --local WALLPAPER ~/personal/dotfiles/macOS/todays_picture_$RANDOM_NUMBER.jpg
    set --local DROPBOX_WALLPAPER ~/Dropbox/Uploads/todays_picture_$RANDOM_NUMBER.jpg

    set --local BASE_URL "https://api.unsplash.com"
    set --local API_IMAGE_URL "$BASE_URL/photos/$PHOTO_ID"
    set --local UNSPLASH_RESPONSE (http --body $API_IMAGE_URL "Authorization: Client-ID $UNSPLASH_ACCESS_KEY")
    set --local IMAGE_URL (echo $UNSPLASH_RESPONSE | jq --raw-output ".urls.full")

    ############################################################################
    # Downloading a random picture and setting it as wallpaper
    ############################################################################
    rm -f $WALLPAPER_IMAGES
    wget --quiet --output-document=$WALLPAPER $IMAGE_URL
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""

    ############################################################################
    # Copying picture to Dropbox so that IFTTT can download it to iOS pictures
    ############################################################################
    rm -f $DROPBOX_IMAGES
    cp $WALLPAPER $DROPBOX_WALLPAPER

end
