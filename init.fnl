(vim.loader.enable)
(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
(set vim.opt.termguicolors true)
(set vim.opt.laststatus 3)
(set vim.wo.number true)
(set vim.opt.ignorecase true)
(set vim.opt.smartcase true)
(set vim.opt.mouse "a")
(set vim.opt.signcolumn "yes")
(set vim.opt.shiftwidth 4)
(set vim.opt.tabstop 4)
(vim.cmd "colorscheme retrobox")

(let [lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim")
      not_created? (not (vim.uv.fs_stat lazypath))]
  (when not_created?
    (let [lazy_repo "https://github.com/folke/lazy.nvim.git"]
      (vim.fn.system ["git" "clone" "--filter=blob:none" "--branch=stable" lazyrepo lazypath])))
  (vim.opt.rtp:prepend lazypath))

(let [lazy (require :lazy)
      treesitter {1 "nvim-treesitter/nvim-treesitter"
                  :build ":TSUpdate"
                  :config (lambda []
                                  (let [ts (require "nvim-treesitter.configs")]
                                    (ts.setup
                                     {:sync_install false
                                      :auto_install true
                                      :highlight {:enable true :additional_vim_regex_highlighting false}})))}

      lsp ["neovim/nvim-lspconfig"]

      conjure ["Olical/conjure"]

      telescope {1 "nvim-telescope/telescope.nvim"
                 :branch "0.1.x"
                 :dependencies ["nvim-lua/plenary.nvim"]}

      blink {1 "saghen/blink.cmp"
             :dependencies ["rafamadriz/friendly-snippets"]
             :version "v0.8.2"
             :opts {:keymap {:preset "enter"}
			 		:sources {:cmdline {}}
                    :appearance {:use_nvim_cmp_as_default true :nerd_font_variant "mono"}
                    :completion {:documentation {:auto_show true :auto_show_delay_ms 100}}
                    :signature {:enabled true}}}]


  (lazy.setup [treesitter lsp telescope blink conjure]))

(let
 [lsp (require :lspconfig)
  capabilities (. (require "blink.cmp") get_lsp_capabilities)]
  (do
    (lsp.rust_analyzer.setup {:capabilities capabilities})))

(let [telescope (require "telescope.builtin")
      normal_maps [["<F6>" vim.lsp.buf.rename]
                   ["gd" vim.lsp.buf.definition]
                   ["<leader>ca" vim.lsp.buf.code_action]
                   ["<leader>r" vim.lsp.buf.references]
                   ["<leader>ff" telescope.find_files]
                   ["<leader>fg" telescope.live_grep]
                   ["<leader>fs" telescope.treesitter]]]
  (each [_ [mapping action] (pairs normal_maps)]
        (vim.keymap.set "n" mapping action)))
