# Install vim-plug with the follwing command
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
