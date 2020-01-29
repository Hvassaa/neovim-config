set nocompatible
filetype plugin indent on
syntax on

set number
set scrolloff=5 "keep 5 lines on screen when scrolling/moving
set lazyredraw 

set tabstop=4
set shiftwidth=0

autocmd CompleteDone * pclose
set splitright
set splitbelow

tnoremap <Esc> <C-\><C-n>

" For neovim, install vim-plug by running
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" LaTeX
" latexmk is needed for compiling
let g:vimtex_complete_enabled = 1
autocmd FileType tex autocmd VimLeave * :VimtexClean
