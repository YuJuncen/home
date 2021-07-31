set nocp 
syntax on
filetype on

" status bar, line number
set laststatus=2
set number
set ruler
colorscheme luna-term

" highlight search, indent 
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
nnoremap <C-e> A
nnoremap <C-a> I 
inoremap <C-e> <ESC>A
inoremap <C-a> <ESC>I

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

PlugInstall