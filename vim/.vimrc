" General configs "
set nu
set relativenumber
set mouse=a

set tabstop=2
set softtabstop=0 expandtab
set shiftwidth=2

" Set plugins "
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
call plug#end()

" Plug configs"
let g:vimtex_view_general_viewer = 'evince'

