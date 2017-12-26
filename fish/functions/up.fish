function up
    brew update; brew upgrade; brew prune; brew cleanup; brew doctor;
    pip3 install --upgrade pip setuptools wheel
end
