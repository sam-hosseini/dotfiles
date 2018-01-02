#!/usr/bin/env bash

CURRENT_DIR=$(pwd)

# Compiling the compiled component of YouCompleteMe
python3 ~/.vim/bundle/YouCompleteMe/install.py

# Compiling the compiled component of Command-t
cd ~/.vim/bundle/command-t
rake make
cd $CURRENT_DIR
