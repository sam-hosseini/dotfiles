function stream
    youtube-dl --output - "$argv" | vlc -
end
