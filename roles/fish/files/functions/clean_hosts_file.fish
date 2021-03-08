function clean_hosts_file
    sudo cp $DOTFILES_REPO/roles/hosts/files/base_hosts /private/etc/hosts
    less /etc/hosts
end
