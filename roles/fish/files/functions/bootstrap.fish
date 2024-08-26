function bootstrap --wraps "ansible-playbook"
    pushd $DOTFILES_REPO/roles/ansible/files
    ansible-playbook bootstrap.yml $argv
    popd
end
