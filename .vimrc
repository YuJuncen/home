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

" some keymaps
nnoremap <C-e> $
nnoremap <C-a> ^ 
inoremap <C-e> <ESC>A
inoremap <C-a> <ESC>I
nnoremap <space> <leader>
nnoremap <C-x><C-f> :Files<CR>
inoremap <C-x><C-f> <ESC>:Files<CR>
let g:camelcasemotion_key = '<leader>'

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'bkad/CamelCaseMotion'
call plug#end()
