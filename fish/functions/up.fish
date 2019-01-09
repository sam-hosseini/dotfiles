function up
    sudo softwareupdate --install --all
    brew update; brew upgrade; brew cask upgrade; brew cleanup; brew doctor;
    pip3 install --upgrade --quiet pip setuptools wheel powerline-status requests flake8
    yarn global upgrade --silent
    omf install; omf update; omf doctor;
end
