set --local --append OWN_PATH /usr/local/opt/python@3.11/libexec/bin

set --local --append OWN_PATH /usr/local/bin      # Where brew symlinks most packages
set --local --append OWN_PATH /usr/local/sbin     # Where brew symlinks some packages
set --local --append OWN_PATH ~/.local/bin        # Where pipx symlinks its  packages

set --global --export fish_user_paths $OWN_PATH
