# Remove fish_greeting
set fish_greeting

# Update PATH
set --local POSTGRES_PATH /Applications/Postgres.app/Contents/Versions/latest/bin
set --local RUBY_PATH /Users/shos/.gem/ruby/2.0.0/bin
set PATH $PATH $POSTGRES_PATH $RUBY_PATH

# Set locale
set --global --export LC_ALL en_US.UTF-8
set --global --export LANG en_US.UTF-8

# Set EDITOR
set --global --export EDITOR vim 

# Configuration for Powerline
set --local POWERLINE_ROOT_REPO /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages
set fish_function_path $fish_function_path "$POWERLINE_ROOT_REPO/powerline/bindings/fish"
powerline-daemon --quiet
powerline-setup

# Configuration for Oh-My-Fish!
set -q XDG_DATA_HOME
    and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
    or set -gx OMF_PATH "$HOME/.local/share/omf"
source $OMF_PATH/init.fish

