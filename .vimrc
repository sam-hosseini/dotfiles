" Required Section By Vundle "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BEGIN PLUGIN LIST "
Plugin 'VundleVim/Vundle.vim' " Required
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'

" END PLUGIN LIST "

" Required Section By Vundle "
call vundle#end()
filetype plugin indent on

" Put your non-Plugin stuff after this line "

" Setting shell explicitly to bash
set shell=/bin/bash

" Turning tabs into 4 spaces " 
set tabstop=4
set shiftwidth=4
set expandtab

" Uncomment following lines for Powerline configuration
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup


