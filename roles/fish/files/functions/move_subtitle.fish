function move_subtitle
    set --local SUBTITLE_FILE  $argv[1]
    set --local SECONDS        $argv[2]

    ffmpeg -itsoffset $SECONDS -i $SUBTITLE_FILE -c copy moved_subtitle.srt
    rm $SUBTITLE_FILE
    mv moved_subtitle.srt $SUBTITLE_FILE
end
