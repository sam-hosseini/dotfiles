############################################################################
# Environment Variables
############################################################################
set --global --export HOMEBREW_NO_AUTO_UPDATE true
set --global --export EDITOR vim
set --global --export PYTHONDONTWRITEBYTECODE 1
set --global --export fish_greeting ''
set --global --export LC_ALL en_US.UTF-8 # Set locale
set --global --export LANG en_US.UTF-8   # Set locale
set --global --export fish_user_paths /usr/local/bin $fish_user_paths # Homebrew programs will be used before system-provided programs


############################################################################
# Configuration for Powerline
############################################################################
set --global --export \
    POWERLINE_ROOT_REPO /usr/local/lib/python3.6/site-packages
set fish_function_path \
    $fish_function_path "$POWERLINE_ROOT_REPO/powerline/bindings/fish"
powerline-daemon --quiet
powerline-setup

############################################################################
# Configuration for Oh-My-Fish!
############################################################################
set -q XDG_DATA_HOME
    and set --global --export OMF_PATH "$XDG_DATA_HOME/omf"
    or set  --global --export OMF_PATH "$HOME/.local/share/omf"
source $OMF_PATH/init.fish

