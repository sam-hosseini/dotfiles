function combine_videos
    set --local VIDEO_ONE $argv[1]
    set --local VIDEO_TWO $argv[2]
    set --local TEMP_FILE list_of_videos

    echo "file $VIDEO_ONE" >> $TEMP_FILE
    echo "file $VIDEO_TWO" >> $TEMP_FILE

    ffmpeg -f concat -i $TEMP_FILE -c copy combined_video.mp4
    rm $TEMP_FILE
end
