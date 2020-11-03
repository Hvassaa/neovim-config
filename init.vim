"------------------
" General Settings
"------------------
set nocompatible
filetype plugin indent on
syntax on
set noshowmode
set number
set scrolloff=5
set lazyredraw
set termguicolors
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

"---------
" Plugins
"---------
" For neovim, install vim-plug ... 
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
call plug#end()

"---------------
" Gruvbox theme
"---------------
"autocmd vimenter * colorscheme gruvbox
colo gruvbox
let g:gruvbox_italic = 1

" From coc wiki, on lightline integration
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

"-------
" LaTeX
"-------
let g:vimtex_complete_enabled = 1
let g:tex_flavor = 'latex'
autocmd FileType tex autocmd VimLeave * :VimtexClean

"------
" IJVM
"------
" ijvm-asm and ijvm should be in path
" compile current file to a .bc
autocmd BufNewFile,BufRead *.j nnoremap <buffer> <F4> :!ijvm-asm %:p %:r.bc<CR>
" run corresponding .bc file, input args and press ENTER
autocmd BufNewFile,BufRead *.j nnoremap <buffer> <F5> :!ijvm %:r.bc 

"-----------
" Golang
"-----------
" disable vim-go :GoDef short cut (gd)
let g:go_def_mapping_enabled = 0
" disable vim-go completion in favour of coc
let g:go_code_completion_enabled = 0

"-----------
" OCaml
"-----------
" ocp-indent
" autocmd FileType ocaml source ~/.opam/default/share/ocp-indent/vim/indent/ocaml.vim

"------------------------------------
" coc.nvim (almost) default settings
"------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

