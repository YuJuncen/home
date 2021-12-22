set nocp 
syntax on
filetype on

" status bar, line number
set laststatus=2
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
nnoremap <C-x><C-f> :Files<CR>
inoremap <C-x><C-f> <ESC>:Files<CR>
inoremap <M-x> <ESC>:

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
