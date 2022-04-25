function ww
    set --local DOWNLOADED_PHOTO    ~/Downloads/*.jpg
    set --local DROPBOX_PHOTO       ~/Dropbox/Photos/photo_(random).jpg
    set --local DROPBOX_PHOTOS      ~/Dropbox/Photos/photo_*.jpg

    if count $DOWNLOADED_PHOTO > /dev/null
        command rm -f $DROPBOX_PHOTOS
        mv $DOWNLOADED_PHOTO $DROPBOX_PHOTO
        osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DROPBOX_PHOTO\""
    else
        echo 'No photo in Downloads folder'
    end
end
