function unsplash
    1password_session
    set --local UNSPLASH_ACCESS_KEY (op get item unsplash | jq --raw-output '.details.sections[1].fields[0].v')

    set --local PHOTO_ID $argv[1]
    set --local RANDOM_NUMBER (random)

    set --local DROPBOX_IMAGES ~/Dropbox/Uploads/todays_picture_*.jpg
    set --local DROPBOX_WALLPAPER ~/Dropbox/Uploads/todays_picture_$RANDOM_NUMBER.jpg

    set --local BASE_URL "https://api.unsplash.com"
    set --local API_IMAGE_URL "$BASE_URL/photos/$PHOTO_ID"
    set --local UNSPLASH_RESPONSE (http --body $API_IMAGE_URL "Authorization: Client-ID $UNSPLASH_ACCESS_KEY")
    set --local IMAGE_URL (echo $UNSPLASH_RESPONSE | jq --raw-output ".urls.full")

    ##################################################################################################
    # Downloading to Dropbox so that IFTTT can download it to iOS pictures and setting it as wallpaper
    ##################################################################################################
    rm -f $DROPBOX_IMAGES
    wget --quiet --output-document=$DROPBOX_WALLPAPER $IMAGE_URL
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DROPBOX_WALLPAPER\""

end
