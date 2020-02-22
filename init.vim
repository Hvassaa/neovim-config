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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
call plug#end()

" LaTeX
" latexmk and pdflatex is needed for compiling
let g:vimtex_complete_enabled = 1
autocmd FileType tex autocmd VimLeave * :VimtexClean


" CoC
" nodejs is needed for coc to work
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolum
set signcolumn=yes

" IJVM
" ijvm-asm and ijvm should be in path
" compile current file to a .bc
autocmd BufNewFile,BufRead *.j nnoremap <buffer> <F4> :!ijvm-asm %:p %:r.bc<CR>
" run corresponding .bc file, input args and press ENTER
autocmd BufNewFile,BufRead *.j nnoremap <buffer> <F5> :!ijvm %:r.bc 
