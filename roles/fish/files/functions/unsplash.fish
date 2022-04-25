function unsplash
    1password_session
    set --local UNSPLASH_ACCESS_KEY (op item get 'Unsplash' --fields label=UNSPLASH_ACCESS_KEY | jq --raw-output .value)

    set --local PHOTO_ID                $argv[1]
    set --local API_PHOTO_URL           "https://api.unsplash.com/photos/$PHOTO_ID"
    set --local RESPONSE                (http --body $API_PHOTO_URL "Authorization: Client-ID $UNSPLASH_ACCESS_KEY")
    set --local PHOTO_URL               (echo $RESPONSE | jq --raw-output ".urls.full")

    http --quiet --download --output ~/Downloads/$PHOTO_ID-unsplash.jpg $PHOTO_URL
    ww
end
