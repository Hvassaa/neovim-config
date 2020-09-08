# Install vim-plug with the follwing command
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Packages needed for this config (debian)

| Package           | For                       | 
|-------------------|---------------------------|
| git               | vim-plug & fugitive       |
| nodejs            | coc.nvim                  |
| npm               | coc.nvim                  |
| clang-tools       | coc-clangd                |
| bear (or cmake)   | (nicer) coc-clangd        |
| texlive           | vimtex                    |
| latexmk           | vimtex                    |
| opam              | for ocaml stuff           |

# coc extension

| Extension         | For                       |
|-------------------|---------------------------|
| coc-clangd        | C/C++                     |
| coc-vimtex        | (latex) vimtex completion |
| coc-json          | json                      |
| coc-html          | html                      |
| coc-css           | css                       |
| coc-python        | python                    |
| coc-go            | golang                    |

# OCaml setup

Again, make sure opam is installed. Then install the following packages with opam, with *opam install ...*

* ocaml-lsp-server
* ocp-indent

You should then be able to indent the current live with "==". Coc should also start and use the language server (given the Coc-config includes it).
