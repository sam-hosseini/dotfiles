function personal_hotspot
    1password_session
    set --local PERSONAL_HOTSPOT_PASSWORD (op get item 'Personal Hotspot' | jq --raw-output '.details.sections[1].fields[0].v')

    networksetup -setairportnetwork en0 "King in the North" $PERSONAL_HOTSPOT_PASSWORD
end
