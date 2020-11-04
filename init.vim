"------------------
" General Settings
"------------------
set nocompatible				" don't try to be vi-compatible
filetype plugin indent on		" detect filetype, use filetype plugin and indent
syntax on						" use syntax highlighting
set noshowmode					" disable vim showing mode, since lightline does it
set number						" show line numbers
set scrolloff=5					" always have >=5 lines under the cursor
set lazyredraw					" don't redraw the screen during macros = performance
set termguicolors				" Enables 24-bit RGB color
set tabstop=4					" Number of spaces that a <Tab> in the file counts for.
set shiftwidth=0				" 0 = use tabstop for indenting (<< / >>)
autocmd CompleteDone * pclose	" autoclose preview windows
set splitright					" saner splitting
set splitbelow					" saner splitting
tnoremap <Esc> <C-\><C-n>		" map <ESC> to exit insert mode in term
set mouse=n 					" enable mouse, why not?
set nowrap						" don't wrap lines visually
set clipboard=unnamedplus		" make vim use system clipboard
set hidden 						" COC: allow switching away from modified buffers
set cmdheight=2					" COC: Better display for messages
set updatetime=300				" COC: Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c				" COC: don't give /ins-completion-menu/ messages.
set signcolumn=yes				" COC: always show signcolumns

"---------
" Plugins
"---------
" For neovim, install vim-plug ... 
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'								" plugin for latex
Plug 'tpope/vim-fugitive'							" plugin for git
Plug 'tpope/vim-commentary'							" plugin for commenting out lines
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" lsp-client plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }	" plugin for golang
Plug 'morhetz/gruvbox'								" plugin for gruvbox theme
Plug 'itchyny/lightline.vim'						" plugin for lightline statusline
Plug 'mattn/emmet-vim'								" plugin for html snippets
call plug#end()

"---------------
" Theming / lightline
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
let g:vimtex_complete_enabled = 1						" enable completion
let g:tex_flavor = 'latex'								" use latex, not tex
autocmd FileType tex autocmd VimLeave * :VimtexClean	" clean up files when leaving a .tex file

"------
" IJVM
"------
" ijvm-asm and ijvm should be in path
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

