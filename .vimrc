set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()

colorscheme solarized
filetype plugin indent on
syntax enable

let g:ctrlp_cmd = 'CtrlPMRU'
let g:notes_directories = [ '~/Dropbox/vim-notes' ]
let g:table_mode_corner="|"

nmap <leader>t :TagbarToggle<CR>

set background=dark
set colorcolumn=73,80
set dir^=~/.vim/swp//
set linebreak
set list
set listchars=precedes:<,extends:>,tab:>\ ,trail:-,nbsp:_
set mouse=a
set mousemodel=popup_setpos
set nowrap
set number
set spelllang=en_gb
set tabstop=3
