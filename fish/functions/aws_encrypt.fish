function aws_encrypt
    set --local STRING_TO_ENCRYPT $argv[1]

    aws kms encrypt --plaintext $STRING_TO_ENCRYPT --key-id $AWS_CMK_ALIAS --output text --query CiphertextBlob | pbcopy
    echo 'Copied to clipboard!'
end
