function update_everything
    update_homebrew

    fisher update > /dev/null

    tldr --update > /dev/null
end
