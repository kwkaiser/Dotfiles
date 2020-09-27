set nu
set mouse=a
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=0 expandtab

set nowrap

" Set plugins "
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'nathangrigg/vim-beancount'
call plug#end()

" Plug configs "
let g:vimtex_view_general_viewer = 'evince'
