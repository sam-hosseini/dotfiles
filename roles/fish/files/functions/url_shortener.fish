function url_shortener
    1password_session
    set --local BITLY_API_TOKEN (op item get 'Bitly' --fields label=BITLY_API_TOKEN | jq --raw-output .value)

    set --local LONG_URL        $argv[1]
    set --local API_URL         https://api-ssl.bitly.com/v4/shorten
    set --local HEADER          "Authorization:Bearer $BITLY_API_TOKEN"
    set --local RESPONSE        (http --body POST $API_URL $HEADER long_url=$LONG_URL domain=bit.ly)
    set --local SHORTENED_URL   (echo $RESPONSE | jq --raw-output '.link')

    echo $SHORTENED_URL | tr -d '\n' | pbcopy
    echo $SHORTENED_URL copied to clipboard!
end
