" General configs "
set nu
set mouse=a
set relativenumber

set tabstop=2
set shiftwidth=2
set softtabstop=0 expandtab

set nowrap

" Set plugins "
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
call plug#end()

" Plug configs"
let g:vimtex_view_general_viewer = 'evince'

