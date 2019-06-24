function optimize_video
    set --local VIDEO_NAME $argv[1]

    ffmpeg -i $VIDEO_NAME optimized_$VIDEO_NAME
end
