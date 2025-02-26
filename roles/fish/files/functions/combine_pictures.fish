function combine_pictures
    magick $argv[1] $argv[2] +append combined_picture.png
end
