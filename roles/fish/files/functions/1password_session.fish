function 1password_session
    set --local USER_UUID (op account list | jq --raw-output '.[0].user_uuid')

    while not set --query OP_SESSION_$USER_UUID
        eval $(op signin)
    end
end
