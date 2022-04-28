-- Neovim exposes a global vim variable which serves as an entry point to interact with its APIs from Lua. It provides users with an extended "standard library" of functions as well as various sub-modules.

-- Some notable functions and modules include:
-- vim.inspect: transform Lua objects into human-readable strings (useful for inspecting tables)
-- vim.regex: use Vim regexes from Lua
-- vim.api: module that exposes API functions (the same API used by remote plugins)
-- vim.ui: overridable UI functions that can be leveraged by plugins
-- vim.loop: module that exposes the functionality of Neovim's event-loop (using LibUV)
-- vim.lsp: module that controls the built-in LSP client
-- vim.treesitter: module that exposes the functionality of the tree-sitter library

--This list is by no means comprehensive. If you wish to know more about what's made available by the vim variable, :help lua-stdlib and :help lua-vim are the way to go. Alternatively, you can do :lua print(vim.inspect(vim)) to get a list of every module. API functions are documented under :help api-global.

require('options')
require('plugins')
