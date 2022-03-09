function fix_persian_subtitle
    set --local SUBTITLE_FILE $argv[1]

    iconv --from-code windows-1256 --to-code utf8 $SUBTITLE_FILE > fixed_subtitle.srt
    rm $SUBTITLE_FILE
    mv fixed_subtitle.srt $SUBTITLE_FILE
end
