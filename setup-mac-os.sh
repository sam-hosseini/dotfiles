#!/usr/bin/env bash

main() {
    ask_for_sudo
    install_homebrew
    brew_install mas
    login_to_app_store
    install_packages_with_brewfile
    change_shell_to_fish
    configure_git
    setup_vim
    setup_symlinks
}

function ask_for_sudo() {
    coloredEcho "Prompting for sudo password..." blue
    sudo --validate
    # Keep-alive
    while true; do sudo --non-interactive true; \
        sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    coloredEcho "Sudo credentials updated." green
}

function login_to_app_store() {
    coloredEcho "Logging into app store..." blue
    if mas account >/dev/null; then
        coloredEcho "Already logged in." green
    else
        open -a "/Applications/App Store.app"
        until (mas account > /dev/null);
        do
            sleep 3
        done
        coloredEcho "Login to app store successful." green
    fi
}

function install_homebrew() {
    coloredEcho "Installing Homebrew..." blue
    if hash brew 2>/dev/null; then
        coloredEcho "Homebrew already exists." green
    else
        url=https://raw.githubusercontent.com/Homebrew/install/master/install
        /usr/bin/ruby -e "$(curl -fsSL ${url})"
        coloredEcho "Homebrew successfully installed." green
    fi
}

function install_packages_with_brewfile() {
    coloredEcho \
        "Fetching Brewfile from dotfiles repository and installating packages..." blue
    url=https://raw.githubusercontent.com/Sajjadhosn/dotfiles/master/brew/macOS.Brewfile
    curl --silent "$url" | brew bundle --file=-
    coloredEcho "Brewfile packages successfully installed." green
}

function brew_install() {
    package_to_install=$1
    coloredEcho "brew install ${package_to_install}" blue
    if hash "$package_to_install" 2>/dev/null; then
        coloredEcho "${package_to_install} already exists." green
    else
        brew install "$package_to_install"
        coloredEcho "Package ${package_to_install} successfully installed." green
    fi
}

function change_shell_to_fish() {
    user=$(whoami)
    coloredEcho "Fish shell setup..." blue
    coloredEcho "Adding Fish executable to /etc/shells"  magenta
    if grep --fixed-strings --line-regexp --quiet "/usr/local/bin/fish" /etc/shells; then
        coloredEcho "Fish executable already exists in /etc/shells" green
    else
        coloredEcho "Switching from \"${user}\" to \"root\"" magenta
        sudo su << END
echo /usr/local/bin/fish >> /etc/shells
END
        coloredEcho "Switched from \"root\" to \"${user}\"" magenta
        coloredEcho "Fish executable successfully added to /etc/shells" green
    fi
    coloredEcho "Switching shell to Fish"  magenta
    chsh -s /usr/local/bin/fish
    coloredEcho "Fish shell successfully set for \"${user}\"" green
}

function configure_git() {
    coloredEcho "Configuring git..." blue
    git config --global user.name "Sajjad Hosseini"
    git config --global user.email "sajjad.hosseini@futurice.com"
    coloredEcho "git successfully configured." green
}

function setup_vim() {
    coloredEcho "Setting up vim..." blue
    coloredEcho "Installing all plugins"  magenta
    vim +PluginInstall +qall
    coloredEcho "Compile the compiled component of YouCompleteMe?"  magenta
    select response in yes no
    do
        if [ "$response" == "yes" ]; then
            coloredEcho "Compiling the compiled component of YouCompleteMe"  magenta
            python3 ~/.vim/bundle/YouCompleteMe/install.py
        else
            coloredEcho "No compilation needed." green
        fi
        break;
    done
    coloredEcho "vim successfully setup." green
}

function setup_symlinks() {
    coloredEcho "Setting up symlinks..." blue
    coloredEcho "Fetching setup-symlinks.sh from dotfiles repository" magenta
    url=https://raw.githubusercontent.com/Sajjadhosn/dotfiles/master/setup-symlinks.sh
    curl --silent "$url" | bash
    coloredEcho "Symlinks successfully setup." green
}

function coloredEcho() {
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf $color;
    echo "===> $exp";
    tput sgr0;
}

function info() {
    coloredEcho "$1" blue
}

function substep() {
    coloredEcho "$1" magenta
}

function success() {
    coloredEcho "$1" green
}

main "$@"
