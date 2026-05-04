function convert_heic_to_jpg
    set --local HEIC_FILE $argv[1]
    set --local JPG_FILE (string replace --ignore-case --regex '\.heic$' '.jpg' $HEIC_FILE)

    magick $HEIC_FILE $JPG_FILE
end
