function aws_encrypt
    1password_session
    set --local AWS_CMK_ALIAS (op get item 'AWS sam.hosseini' | jq --raw-output '.details.sections[1].fields[1].v')

    set --local STRING_TO_ENCRYPT $argv[1]

    aws kms encrypt --plaintext $STRING_TO_ENCRYPT --key-id $AWS_CMK_ALIAS --output text --query CiphertextBlob | pbcopy
    echo 'Copied to clipboard!'
end
