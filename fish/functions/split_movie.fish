function split_movie
    # Splits a given movie into equal X minutes parts

    set --local FILENAME $argv[1]
    set --local MINUTES (math "$argv[2] * 60")

    # https://apple.stackexchange.com/a/110706/200178
    ffmpeg \
        -i $FILENAME \
        -hide_banner \
        -loglevel error \
        -c copy \
        -f segment \
        -segment_time $MINUTES \
        -reset_timestamps 1 \
        split_\%02d.mp4
end
