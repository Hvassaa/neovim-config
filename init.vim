" general settings
set nocompatible
filetype plugin indent on
set number
set termguicolors
set ignorecase
set smartcase
set splitright
set splitbelow
set mouse=n
set nowrap
set signcolumn=yes
set clipboard=unnamedplus
set laststatus=3
filetype plugin indent on
set tabstop=4
set shiftwidth=4
highlight WinSeparator guibg=None
autocmd CompleteDone * pclose
map <F8> :setlocal spell! spelllang=en_gb<CR>

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin(stdpath('data') . '/plugged')
call plug#begin()
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
require('lspconfig').pyright.setup{ on_attach = on_attach }
require('lspconfig').rnix.setup{ on_attach = on_attach }
require('lspconfig').vimls.setup{ on_attach = on_attach }
require('lspconfig').clangd.setup{ on_attach = on_attach }
EOF

" LaTeX/vimtex settings 
let g:vimtex_complete_enabled = 1
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'evince'
autocmd FileType tex autocmd VimLeave * :VimtexClean
autocmd FileType tex,md setlocal textwidth=80
