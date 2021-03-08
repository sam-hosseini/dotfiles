function bootstrap --wraps "ansible-playbook"
    sudo --validate

    pushd $DOTFILES_REPO/roles/ansible/files
    ansible-playbook bootstrap.yml $argv
    popd
end
