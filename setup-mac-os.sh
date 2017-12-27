#!/usr/bin/env bash

main() {
    ask_for_sudo
    install_homebrew
    brew_install mas
    login_to_app_store
    install_packages_with_brewfile
    change_shell_to_fish
    configure_git
    clone_dotfiles_repo
    pip3_install powerline-status
    setup_symlinks
    setup_vim
    configure_iterm2
}

function ask_for_sudo() {
    info "Prompting for sudo password..."
    sudo --validate
    # Keep-alive
    while true; do sudo --non-interactive true; \
        sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
}

function login_to_app_store() {
    info "Logging into app store..."
    if mas account >/dev/null; then
        success "Already logged in."
    else
        open -a "/Applications/App Store.app"
        until (mas account > /dev/null);
        do
            sleep 3
        done
        success "Login to app store successful."
    fi
}

function install_homebrew() {
    info "Installing Homebrew..."
    if hash brew 2>/dev/null; then
        success "Homebrew already exists."
    else
        url=https://raw.githubusercontent.com/Homebrew/install/master/install
        /usr/bin/ruby -e "$(curl -fsSL ${url})"
        success "Homebrew successfully installed."
    fi
}

function install_packages_with_brewfile() {
    info "Fetching Brewfile from dotfiles repository and installating packages..."
    url=https://raw.githubusercontent.com/Sajjadhosn/dotfiles/master/brew/macOS.Brewfile
    curl --silent "$url" | brew bundle --file=-
    success "Brewfile packages successfully installed."
}

function brew_install() {
    package_to_install=$1
    info "brew install ${package_to_install}"
    if hash "$package_to_install" 2>/dev/null; then
        success "${package_to_install} already exists."
    else
        brew install "$package_to_install"
        success "Package ${package_to_install} successfully installed."
    fi
}

function change_shell_to_fish() {
    info "Fish shell setup..."
    if grep --quiet fish <<< "$SHELL"; then
        success "Fish shell already exists."
    else
        user=$(whoami)
        substep "Adding Fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet "/usr/local/bin/fish" /etc/shells; then
            substep "Fish executable already exists in /etc/shells"
        else
            substep "Switching from \"${user}\" to \"root\""
            sudo su << END
echo /usr/local/bin/fish >> /etc/shells
END
            substep "Switched from \"root\" to \"${user}\""
            substep "Fish executable successfully added to /etc/shells"
        fi
        substep "Switching shell to Fish"
        if chsh -s /usr/local/bin/fish; then
            success "Fish shell successfully set for \"${user}\""
        else
            error "Please try setting the Fish shell again."
        fi
    fi
}

function configure_git() {
    info "Configuring git..."
    git config --global user.name "Sajjad Hosseini"
    git config --global user.email "sajjad.hosseini@futurice.com"
    success "git successfully configured."
}

function clone_dotfiles_repo() {
    info "Cloning dotfiles repository into ~/personal/dotfiles ..."
    if test -e ~/personal/dotfiles; then
        success "~/personal/dotfiles already exists."
        pull_latest ~/personal/dotfiles
    else
        url=https://github.com/Sajjadhosn/dotfiles.git
        git clone "$url" ~/personal/dotfiles
        success "Clonned into ~/personal/dotfiles"
    fi
}

function pull_latest() {
    info "Pulling latest changes in ${1} repository..."
    if git -C "$1" pull origin master; then
        success "Pull successful in ${1} repository."
    else
        error "Please pull the latest changes in ${1} repository manually."
    fi
}

function setup_vim() {
    info "Setting up vim..."
    substep "Installing Vundle"
    if test -e ~/.vim/bundle/Vundle.vim; then
        substep "Vundle already exists."
        pull_latest ~/.vim/bundle/Vundle.vim
    else
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    substep "Installing all plugins"
    vim +PluginInstall +qall
    substep "Compile the compiled component of YouCompleteMe?"
    select response in yes no
    do
        if [ "$response" == "yes" ]; then
            substep "Compiling the compiled component of YouCompleteMe"
            python3 ~/.vim/bundle/YouCompleteMe/install.py
        else
            success "No compilation needed."
        fi
        break;
    done
    success "vim successfully setup."
}

function configure_iterm2() {
    info "Configuring iTerm2..."
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/personal/dotfiles/iTerm2"
    substep "Opening iTerm2"
    osascript -e 'tell application "iTerm" to activate'
    success "iTerm2 successfully configured."
}

function setup_symlinks() {
    info "Setting up symlinks..."
    substep "Fetching setup-symlinks.sh from dotfiles repository"
    url=https://raw.githubusercontent.com/Sajjadhosn/dotfiles/master/setup-symlinks.sh
    curl --silent "$url" | bash
    success "Symlinks successfully setup."
}

function pip3_install() {
    package_to_install="$1"
    info "pip3 install ${package_to_install}"
    if pip3 --quiet show "$package_to_install"; then
        success "${package_to_install} already exists."
    else
        pip3 install "$package_to_install"
        success "Package ${package_to_install} successfully installed."
    fi
}

function coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
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
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

function info() {
    coloredEcho "$1" blue "========>"
}

function substep() {
    coloredEcho "$1" magenta "===="
}

function success() {
    coloredEcho "$1" green "========>"
}

function error() {
    coloredEcho "$1" red "========>"
}

main "$@"
