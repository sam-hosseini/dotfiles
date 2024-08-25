function bootstrap --wraps "ansible-playbook"
    pushd $DOTFILES_REPO/roles/ansible/files
    ansible-playbook --ask-become-pass bootstrap.yml $argv
    popd
end
