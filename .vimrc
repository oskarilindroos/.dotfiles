set nocompatible
filetype off

set encoding=utf8
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim' " Plugin Manager

Plugin 'scrooloose/nerdtree' " Tree explorer

Plugin 'gko/vim-coloresque' " Display css colors on top of the text

Plugin 'maksimr/vim-jsbeautify' " Format js, html, css

Plugin 'justinmk/vim-gtfo' " Opens current file's directory in the File Manager by typing 'gof'

Plugin 'vim-airline/vim-airline' " Cooler and more practical statusline

Plugin 'KabbAmine/vCoolor.vim' " Brings up a window to select colors easily

Plugin 'Valloric/YouCompleteMe' " Offers autocompletion for a bunch of languages

Plugin 'alvan/vim-closetag' " Auto closes html tags

Plugin 'spf13/vim-autoclose' " Auto closes brackets and quotes

call vundle#end()
filetype plugin indent on

" Set number lines and highlight syntax
set number
set rnu " Relative
syntax on

" Enable ruler
set ruler

" Disable wrapping
set nowrap

" Disable swapfile
set noswapfile

" Custom mapping
inoremap jk <esc>
inoremap <esc> <nop>
map <C-n> :NERDTreeToggle<CR>  " Toggle NerdTree
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
set backspace=indent,eol,start " Make backspace delete
map <C-h> :vertical resize -5<CR>
map <C-l> :vertical resize +5<CR>
map <C-j> :resize +5<CR>
map <C-k> :resize -5<CR>
nmap <F8> :TagbarToggle<CR>
map <C-o> :bnext<CR> " Bind 'Ctrl+o' to change to next buffer
map <C-i> :bprev<CR> " Bind 'Ctrl+i' to change to previous buffer
map <F9> :call ToggleWrap()<CR> " Bind 'F9' to toggle line wrapping
map! <F9> ^[:call ToggleWrap()<CR>

" fuction to make a keybind for toggling line wrapping
function ToggleWrap()
    if (&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunction

" Ignore these filetypes
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.psd
set wildignore+=*.jpg
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
let NERDTreeIgnore = ['\.psd$']

" Customize theme
colorscheme delek
set background=light

" Change font
set guifont=Ubuntu\ Mono\ 16

" Set nerd tree arrows
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

" No annoying alert
" set visualbell
set belloff=all

" Customize status line
" set laststatus=2
" set statusline=%f\ -\ filetype:\ %y%=%-4l\ %-4L

" Init window size and loc
" set lines=50 columns=120
" winpos 0 80

" Hide menu and toolbar
" set guioptions -=m
 set guioptions-=T
" 
" " Hide scrollbars
 set guioptions-=r
 set guioptions-=L
" 
" Undo buffer
set undofile
set undodir=$HOME/.vimundo
set undolevels=1000
set undoreload=10000

" Add powerline fonts to vim-airline
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" Css autocomplete 
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Not sure what this is
set autoindent
set smartindent
set cindent
set shiftwidth=4
set numberwidth=6
set expandtab
set softtabstop=4
set tabstop=4
set wildmenu
set mouse=n
