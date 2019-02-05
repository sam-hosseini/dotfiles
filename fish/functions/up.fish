function up
    echo -e '####################################\n# Software Update \n####################################'
    sudo softwareupdate --install --all
    echo -e '####################################\n# Brew \n####################################'
    brew update; brew upgrade; brew cask upgrade; brew cleanup; brew doctor;
    echo -e '####################################\n# Pip \n####################################'
    pip3 install --upgrade --quiet pip setuptools wheel powerline-status requests tmuxp virtualenv
    echo -e '####################################\n# Yarn \n####################################'
    yarn global upgrade --silent
    echo -e '\n####################################\n# Oh-My-Fish \n####################################'
    omf install; omf update;
    echo -e '####################################\n# Done \n####################################'
end
