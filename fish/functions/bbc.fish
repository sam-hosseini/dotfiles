function bbc
    set --local TAP  ~/personal/dotfiles/brew/Brewfile_tap
    set --local BREW ~/personal/dotfiles/brew/Brewfile_brew
    set --local CASK ~/personal/dotfiles/brew/Brewfile_cask
    set --local MAS  ~/personal/dotfiles/brew/Brewfile_mas
    set --local BREWFILE ~/personal/dotfiles/brew/Brewfile

    cat $TAP $BREW $CASK $MAS > $BREWFILE
    brew bundle cleanup --file=$BREWFILE --force
end
