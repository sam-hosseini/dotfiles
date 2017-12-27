" Required Section By Vundle "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BEGIN PLUGIN LIST "
Plugin 'VundleVim/Vundle.vim' " Required
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin '907th/vim-auto-save'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'djoshea/vim-autoread'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ntpeters/vim-better-whitespace'

" END PLUGIN LIST "

" Required Section By Vundle "
call vundle#end()
filetype plugin indent on

" Put your non-Plugin stuff after this line "

" Setting shell explicitly to bash
set shell=/bin/bash

" Turning tabs into 4 spaces "
set tabstop=4 " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4 " number of spaces to use for auto indent
set expandtab " enter spaces when tab is pressed

" Powerline configuration
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Disable matchparen plugin at startup
au VimEnter * NoMatchParen

" Set desired color scheme
colorscheme dracula

" Syntastic configurations
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Making Vim work with system clipboard
set clipboard=unnamed

" Snippet engine configuration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Set Vim's updatetime delay
set updatetime=1000

" Autosave configurations
let g:auto_save = 0

" NERDTree configurations
" always show hidden files
let NERDTreeShowHidden = 1
" open NERDTree when vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map control-o, to toggle the tree
map <C-o> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1
" disable that old “Press ? for help”
let NERDTreeMinimalUI = 1
" ignore files
let NERDTreeIgnore = ['\.swp$', '\.DS_Store$', '\.git$', '\.node_modules$']

" Re-map enter to save the file
nmap <CR> :write<CR>
cabbrev w use enter to save the file

" Show line number next to lines
set number

" Preserving soft/hard links https://goo.gl/QDC1sU
set backupcopy=yes

" YouCompleteMe configurations
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" vim-better-whitespace plugin configurations
autocmd BufEnter * EnableStripWhitespaceOnSave
