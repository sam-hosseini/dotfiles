function generate_locally_trusted_certificate
    mkcert -cert-file cert.pem -key-file key.pem localhost 127.0.0.1
end
