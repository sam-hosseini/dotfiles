function 1password_session
    if op get account > /dev/null
        return
    else
        eval (op signin my)
    end
end
