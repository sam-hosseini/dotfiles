function extract_audio
    set --local URL $argv[1]

    yt-dlp \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        $URL
end
