function aws_decrypt
    set --local ENCRYPTED_STRING $argv[1]
    set --local INTERMEDIATE_FILENAME (random)_filename

    echo $ENCRYPTED_STRING | base64 --decode > $INTERMEDIATE_FILENAME
    aws kms decrypt --ciphertext-blob fileb://$INTERMEDIATE_FILENAME --output text --query Plaintext | base64 --decode
    rm $INTERMEDIATE_FILENAME
end
