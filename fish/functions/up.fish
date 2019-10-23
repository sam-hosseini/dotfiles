function up
    echo -e '####################################\n# Software Update \n####################################'
    sudo softwareupdate --install --all

    echo -e '####################################\n# Brew \n####################################'
    brew update
    brew upgrade
    mas upgrade
    brew cask outdated --greedy --verbose | ack --invert-match latest | awk '{print $1;}' | xargs brew cask upgrade
    brew cleanup
    brew doctor

    echo -e '####################################\n# Pip \n####################################'
    pip-sync ~/personal/dotfiles/pip/requirements.txt

    echo -e '####################################\n# Yarn \n####################################'
    yarn global upgrade --silent

    echo -e '\n####################################\n# Oh-My-Fish \n####################################'
    omf install; omf update;

    echo -e '####################################\n# Done \n####################################'
end
