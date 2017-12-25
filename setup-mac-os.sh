#!/usr/bin/env bash

main() {
    ask_for_sudo
    install_homebrew
    brew_install mas
    login_to_app_store
    install_packages_with_brewfile
    change_shell_to_fish
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

main "$@"
