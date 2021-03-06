set nocompatible
filetype off

" ----------------------------------------------------------------------------
" Plugin settings
" ----------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------
" Vim settings
" ----------------------------------------------------------------------------
set autoindent
set cindent
set smartindent
set tabstop=4       " Tab to space 4
set shiftwidth=4
set nu              " Adds line number
set ruler
set title
syntax on
set hlsearch
set bg=dark
set et
set incsearch
set showcmd
set autoread
set mouse=a
"set visualbell      " Show error sign on screen instead of sound
set ww+=h,l         " Possible to move line using h,l
set linebreak       " Break line by word
set t_ut=""         " Prevent background color bug in WSL
colorscheme gruvbox

" ----------------------------------------------------------------------------
" File type settings
" ----------------------------------------------------------------------------
au Filetype c               set tabstop=8 | set shiftwidth=8
au Filetype asm             set tabstop=8 | set shiftwidth=8
au Filetype html            set tabstop=2 | set shiftwidth=2
au Filetype css             set tabstop=2 | set shiftwidth=2
au Filetype javascript      set tabstop=2 | set shiftwidth=2
au Filetype typescript      set tabstop=2 | set shiftwidth=2
au Filetype typescriptreact set tabstop=2 | set shiftwidth=2

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<CR>
nnoremap <silent> <C-j> :move+<CR>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" Auto bracket
" ----------------------------------------------------------------------------
inoremap <silent> (<CR> ()<Esc>i<CR><Esc>O
inoremap <silent> {<CR> {}<Esc>i<CR><Esc>O
inoremap <silent> [<CR> []<Esc>i<CR><Esc>O

" ----------------------------------------------------------------------------
" Remapping
" ----------------------------------------------------------------------------
inoremap <silent> <S-Tab> <C-p>
inoremap <silent> <C-j>   <Esc>ja
inoremap <silent> <C-k>   <Esc>ka
inoremap <silent> <C-h>   <Esc>i
inoremap <silent> <C-l>   <Esc>la

" ----------------------------------------------------------------------------
" Compile c, c++, java source file
" ----------------------------------------------------------------------------
function Compile()
    !clear && cpl '%:p'
endfunction

nnoremap <Leader>b :call Compile()<CR>

" ----------------------------------------------------------------------------
" Compile c, c++ source file and debug with gdb
" ----------------------------------------------------------------------------
function Debug()
    !clear && cpl -g '%:p' && gdb '%:p:r'
endfunction

nnoremap <Leader>d :call Debug()<CR>

" ----------------------------------------------------------------------------
" Compile c, c++, java, python source file and run
" ----------------------------------------------------------------------------
function Run()
    !clear && cpl '%:p' && rn '%:p'
endfunction

nnoremap <Leader>r :call Run()<CR>

" ----------------------------------------------------------------------------
" For Tagbar
" ----------------------------------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" For NERDTree
" ----------------------------------------------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <Esc>:NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" For NERDCommenter
" ----------------------------------------------------------------------------
let g:NERDCustomDelimiters = {'cpp': { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/'}}

" ----------------------------------------------------------------------------
" For Airline
" ----------------------------------------------------------------------------
let g:airline_theme = 'bubblegum'

" ----------------------------------------------------------------------------
" Close vim if the only window left open is a NERDTree
" ----------------------------------------------------------------------------
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----------------------------------------------------------------------------
" Macros
" ----------------------------------------------------------------------------
let @i="ggVG="
let @p="i#include <iostream>\<CR>\<CR>using namespace std;\<CR>\<CR>int main() {\<CR>\<CR>return 0;\<Esc>kko"
let @c="i#include <stdio.h>\<CR>\<CR>int main()\<CR>{\<CR>\<CR>return 0;\<Esc>kko"
let @j="ipublic class  {\<CR>public static void main(String[] args) {\<CR>\<Esc>ggeela"
let @h="i<!DOCTYPE html>\<CR><html>\<CR><head>\<CR><meta charset=\"UTF-8\">\<CR><title></title>\<CR><link rel=\"stylesheet\" href=\"./style.css\">\<CR></head>\<CR><body>\<CR></body>\<CR></html>\<Esc>:5\<CR>f>a"
