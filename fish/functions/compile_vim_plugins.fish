function compile_vim_plugins
    set --local CURRENT_DIR (pwd)

    # Compiling the compiled component of YouCompleteMe
    python ~/.vim/bundle/YouCompleteMe/install.py

    # Compiling the compiled component of Command-t
    cd ~/.vim/bundle/command-t
    rake make
    cd $CURRENT_DIR
end
