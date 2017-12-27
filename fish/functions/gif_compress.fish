function gif_compress
    switch "$argv[2]"
    case high
        gifsicle --interlace $argv[1] -O3 --colors 64 --output compressed.gif
    case medium
        gifsicle --interlace $argv[1] -O3 --colors 128 --output compressed.gif
    case low
        gifsicle --interlace $argv[1] -O3 --colors 256 --output compressed.gif
    case '*'
        echo "Usage: gif_compress FILE high/medium/low"
    end
end
