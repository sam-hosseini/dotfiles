set --local BREW_PREFIX (brew --prefix)

set --local --append OWN_PATH $BREW_PREFIX/opt/node@24/bin
set --local --append OWN_PATH $BREW_PREFIX/opt/postgresql@18/bin
set --local --append OWN_PATH $BREW_PREFIX/opt/python@3.15/libexec/bin

set --local --append OWN_PATH $BREW_PREFIX/opt/ruby/bin
set --local --append OWN_PATH $BREW_PREFIX/lib/ruby/gems/4.0.0/bin

set --local --append OWN_PATH $BREW_PREFIX/bin      # Where brew symlinks most packages
set --local --append OWN_PATH $BREW_PREFIX/sbin     # Where brew symlinks some packages
set --local --append OWN_PATH ~/.local/bin          # Where pipx symlinks its  packages

set --global --export fish_user_paths $OWN_PATH
