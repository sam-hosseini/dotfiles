function 1password_session
    if op get account > /dev/null
        return
    else
        while true
            if eval (op signin my)
                break
            end
        end
    end
end
