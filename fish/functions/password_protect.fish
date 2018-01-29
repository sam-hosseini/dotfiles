function password_protect
    7z a -mx=0 -mhe=on -p password_protected.7z $argv
end
