" Use system clipboard
set clipboard=unnamedplus

" Set space as leader key
let mapleader =" "

" Insert mode key bindings
inoremap jk <Esc>

" Normal mode key bindings
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w :w<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprev<CR>
nnoremap <leader>to :tabo<CR>

nnoremap <C-b> <Nop>