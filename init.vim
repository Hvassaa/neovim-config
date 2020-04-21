set nocompatible
filetype plugin indent on
syntax on

set number
set scrolloff=5 "keep 5 lines on screen when scrolling/moving
set lazyredraw 

set tabstop=4
set shiftwidth=0

" autoclose preview windows
autocmd CompleteDone * pclose

" saner splitting
set splitright
set splitbelow

" map <ESC> to exit insert mode in term
tnoremap <Esc> <C-\><C-n>

" enable mouse, why not?
set mouse=n

" For neovim, install vim-plug by running
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

" LaTeX
let g:vimtex_complete_enabled = 1
autocmd FileType tex autocmd VimLeave * :VimtexClean


" CoC
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

" javascript
let g:vim_jsx_pretty_colorful_config = 1
