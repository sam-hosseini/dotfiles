function up
    sudo softwareupdate --install --all
    brew update; brew upgrade; brew prune; brew cleanup; brew doctor;
    pip3 install --upgrade pip setuptools wheel
    omf install; omf update; omf reload; omf doctor;
end
