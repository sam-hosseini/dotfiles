function public_key
    set --local PUBLIC_KEY_PATH ~/.ssh/id_rsa.pub

    if test -e $PUBLIC_KEY_PATH
        cat $PUBLIC_KEY_PATH | tr -d '\n' | pbcopy
    else
        ssh-keygen -f ~/.ssh/id_rsa
        cat $PUBLIC_KEY_PATH | tr -d '\n' | pbcopy
    end
end
