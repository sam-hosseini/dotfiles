function venv
    if test ! -e venv
        python3 -m venv venv
    end

    source venv/bin/activate.fish
end
