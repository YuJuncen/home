set nocp 
syntax on
filetype on

" status bar, line number
set laststatus=4
set number relativenumber
set ruler
colorscheme luna-term

" highlight search, indent 
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
nnoremap <C-e> $
nnoremap <C-a> ^ 
inoremap <C-e> <ESC>A
inoremap <C-a> <ESC>I

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'
call plug#end()
