function convert_audible
    1password_session
    set --local AUDIBLE_AUTHENTICATION_CODE (op get item 'Audible' | jq --raw-output '.details.sections[1].fields[0].v')

    set --local AAX_FILE_TO_CONVERT $argv[1]
    set --local AUDIBLE_CONVERT_SCRIPT_URL https://raw.githubusercontent.com/KrumpetPirate/AAXtoMP3/master/AAXtoMP3

    http --quiet --download --output /tmp/audible_convert_script $AUDIBLE_CONVERT_SCRIPT_URL
    bash /tmp/audible_convert_script --authcode $AUDIBLE_AUTHENTICATION_CODE --single $AAX_FILE_TO_CONVERT
end
