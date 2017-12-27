#!/usr/bin/env bash

main() {
    # First things first, asking for sudo credentials
    ask_for_sudo
    # Installing Homebrew, the basis of anything and everything
    install_homebrew
    # Installing mas using brew as the requirement for login_to_app_store
    brew_install mas
    # Ensuring the user is logged in the App Store so that
    # install_packages_with_brewfile can install App Store applications
    # using mas cli application
    login_to_app_store
    # Cloning Dotfiles repository for install_packages_with_brewfile
    # to have access to Brewfile
    clone_dotfiles_repo
    # Installing all packages in Dotfiles repository's Brewfile
    install_packages_with_brewfile
    # Changing default shell to Fish
    change_shell_to_fish
    # Configuring git config file
    configure_git
    # Installing powerline-status so that setup_symlinks can setup the symlinks
    pip2_install powerline-status
    # Setting up symlinks so that setup_vim can install all plugins
    setup_symlinks
    # Setting up Vim
    setup_vim
    # Configuring iTerm2
    configure_iterm2
}

DOTFILES_REPO=~/personal/dotfiles

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
    info "Installing packages within ${DOTFILES_REPO}/brew/macOS.Brewfile ..."
    brew bundle --file=$DOTFILES_REPO/brew/macOS.Brewfile
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
    info "Cloning dotfiles repository into ${DOTFILES_REPO} ..."
    if test -e $DOTFILES_REPO; then
        success "${DOTFILES_REPO} already exists."
        pull_latest $DOTFILES_REPO
    else
        url=https://github.com/Sajjadhosn/dotfiles.git
        git clone "$url" $DOTFILES_REPO
        success "Clonned into ${DOTFILES_REPO}"
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
    vim +PluginInstall +qall 2> /dev/null
    success "vim successfully setup."
}

function configure_iterm2() {
    info "Configuring iTerm2..."
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${DOTFILES_REPO}/iTerm2"
    substep "Opening iTerm2"
    osascript -e 'tell application "iTerm" to activate'
    success "iTerm2 successfully configured."
}

function setup_symlinks() {
    POWERLINE_ROOT_REPO=/usr/local/lib/python2.7/site-packages
    info "Setting up symlinks..."

    substep "Symlinking vim"
    rm -f ~/.vimrc
    ln -s "${DOTFILES_REPO}/vim/.vimrc" ~/.vimrc

    substep "Symlinking fish"
    rm -rf ~/.config/fish/{completions,functions,config.fish}
    rm -rf ~/.config/omf
    ln -s "${DOTFILES_REPO}/fish/completions" ~/.config/fish/completions
    ln -s "${DOTFILES_REPO}/fish/functions"   ~/.config/fish/functions
    ln -s "${DOTFILES_REPO}/fish/config.fish" ~/.config/fish/config.fish
    ln -s "${DOTFILES_REPO}/fish/oh_my_fish"  ~/.config/omf

    substep "Symlinking powerline"
    rm -rf "${POWERLINE_ROOT_REPO}/powerline/config_files"
    ln -s "${DOTFILES_REPO}/powerline" \
          "${POWERLINE_ROOT_REPO}/powerline/config_files"

    substep "Symlinking tmux"
    rm -f ~/.tmux.conf
    ln -s "${DOTFILES_REPO}/tmux/.tmux.conf" ~/.tmux.conf

    success "Symlinks successfully setup."
}

function pip2_install() {
    package_to_install="$1"
    info "pip2 install ${package_to_install}"
    if pip2 --quiet show "$package_to_install"; then
        success "${package_to_install} already exists."
    else
        pip2 install "$package_to_install"
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
