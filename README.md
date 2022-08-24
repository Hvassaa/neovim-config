# LSP 

In general, `$HOME/.local/bin/` should be in path (so configure `.bashrc` or `fish_add_path $HOME/.local/bin` for fish).
Also, I keep manually downloaded servers and a workspace folder in `$HOME/LSP`.

## npm setup

Many LSP servers are installed through `npm`:

* Install `npm`
* Configure `npm` prefix, like `npm config set prefix '$HOME/.local/'` (make sure
  directory exists)
* Install packages globally with `npm install PACKAGE -g`

## lua LSP (sumneko\_lua)

* Install `sumneko_lua` (i.e. to `$HOME/LSP/lua-language-server-VERSION-linux-x64`) (https://github.com/sumneko/lua-language-server)
* Add a wrapper to `$HOME/.local/bin/` with the following content:
```
#!/bin/bash
exec "$HOME/LSP/lua-language-server-VERSION-linux-x64/bin/lua-language-server" "$@"
```
* Make sure it is executable `chmod +x $HOME/LSP/lua-language-server-VERSION-linux-x64/bin/lua-language-server`

## java LSP (jdtls)

* Install `jdtls` (i.e. to `$HOME/LSP/jdt-language-server-VERSION`)
  (https://github.com/eclipse/eclipse.jdt.ls)
* Configure the variables `workspace_dir` and `jdtls_dir`  in `./ftplugin/java.lua`, i.e. for me,
```
local workspace_dir = '/home/rasmus/LSP/workspace/' .. project_name
local jdtls_dir = '/home/rasmus/LSP/jdt-language-server-1.15.0-202208220516'
```
