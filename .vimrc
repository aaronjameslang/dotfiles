set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
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

syntax enable
filetype plugin indent on
set background=dark
colorscheme solarized

set number
set mouse=a
set mousemodel=popup_setpos
set tabstop=3
"set shiftwidth=3
set list
set listchars=
set listchars+=tab:>\ ,trail:-,nbsp:_
set listchars+=precedes:<,extends:>
set colorcolumn=73,80
set nowrap
set linebreak
set dir^=~/.vim/swp//
set spelllang=en_gb

nmap <leader>t :TagbarToggle<CR>
let g:ctrlp_cmd = 'CtrlPMRU'
let g:notes_directories = [ '~/Dropbox/vim-notes' ]
