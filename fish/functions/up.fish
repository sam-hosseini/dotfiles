function up
    sudo softwareupdate --install --all
    brew update; brew upgrade; brew cask upgrade; brew prune; brew cleanup; brew doctor;
    pip3 install --upgrade --quiet pip setuptools wheel powerline-status requests python-dotenv flake8
    yarn global upgrade --silent
    omf install; omf update; omf reload; omf doctor;
end
