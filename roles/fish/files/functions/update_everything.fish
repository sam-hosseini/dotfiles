function update_everything
    sudo --validate

    update_homebrew

    fisher update > /dev/null

    tldr --update > /dev/null
end
