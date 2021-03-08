function 1password_session
    if op get account &> /dev/null
        return
    else
        while true
            set --local 1PASSWORD_TOKEN (op signin my --output=raw)
            if test $1PASSWORD_TOKEN
                set --global --export OP_SESSION_my $1PASSWORD_TOKEN
                break
            end
        end
    end
end
