execute pathogen#infect()
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
