set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ElmCast/elm-vim'
Plugin 'majutsushi/tagbar'
Plugin 'moll/vim-node'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()

"colorscheme solarized # Yet to fix dark highlight issue
filetype plugin indent on
syntax enable

highlight colorcolumn ctermbg=0

"let g:notes_unicode_enabled = 0
let &showbreak = '!> '
let g:ctrlp_cmd = 'CtrlPMRU'
let g:notes_directories = [ '~/Dropbox/vim-notes' ]
let g:notes_smart_quotes = 0
let g:syntastic_javascript_checkers = ['standard', 'jscs','jshint']
let g:table_mode_corner="|"

nmap <leader>t :TagbarToggle<CR>
"23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
set background=dark
set clipboard=unnamedplus
set colorcolumn=+1
set dir^=~/.vim/swp//
set expandtab
set hlsearch
set linebreak
set list
set listchars=precedes:<,extends:>,tab:>\ ,trail:-,nbsp:_
set modeline
set mouse=a
set mousemodel=popup_setpos
set number
set shiftwidth=2
set spelllang=en_gb
set tabstop=2
set textwidth=72
set wrap
