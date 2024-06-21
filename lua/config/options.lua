-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\ "

local opt = vim.opt

opt.wrap = true -- Enable line wrap

-- LazyVim auto format
-- vim.g.autoformat = true

-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
-- vim.g.lazyvim_picker = "auto"

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
-- Added `.hg`, `.svn`
vim.g.root_spec = { "lsp", { ".git", "lua", ".hg", ".svn" }, "cwd" }

-- LazyVim automatically configures lazygit:
--  * theme, based on the active colorscheme.
--  * editorPreset to nvim-remote
--  * enables nerd font icons
-- Set to false to disable.
-- vim.g.lazygit_config = true

-- Options for the LazyVim statuscolumn
-- vim.g.lazyvim_statuscolumn = {
--   folds_open = false, -- show fold sign when fold is open
--   folds_githl = false, -- highlight fold sign with git sign color
-- }

-- Optionally setup the terminal to use
-- This sets `vim.o.shell` and does some additional configuration for:
-- * pwsh
-- * powershell
-- LazyVim.terminal.setup("pwsh")

-- Hide deprecation warnings
-- vim.g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- vim.g.trouble_lualine = true

--------------------------------------------------------------------------------

local opt = vim.opt

opt.autowrite = false -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
-- opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- opt.cursorline = true -- Enable highlighting of the current line
-- opt.expandtab = true -- Use spaces instead of tabs
-- opt.fillchars = {
--   foldopen = ">",
--   foldclose = "<",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }
-- opt.foldlevel = 99
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.ignorecase = true -- Ignore case
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.laststatus = 3 -- global statusline
opt.linebreak = false -- Wrap lines at convenient points | Default: true
-- opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "" -- Enable mouse mode | Default: "a"
-- opt.number = true -- Print line number
-- opt.pumblend = 10 -- Popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 3 -- Lines of context | Default: 4
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shiftround = true -- Round indent
-- opt.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.showmode = false -- Dont show mode since we have a statusline
-- opt.sidescrolloff = 8 -- Columns of context
-- opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- opt.smartcase = true -- Don't ignore case with capitals
-- opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = { "en" }
-- opt.spelloptions:append("noplainbuffer")
-- opt.splitbelow = true -- Put new windows below current
-- opt.splitkeep = "screen"
-- opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
-- opt.tabstop = 2 -- Number of spaces tabs count for
-- opt.termguicolors = true -- True color support
-- opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
-- opt.undofile = true
-- opt.undolevels = 10000
-- opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- Completion mode that is used for the character specified with
-- 'wildchar'.  It is a comma separated list of up to four parts.  Each
-- part specifies what to do for each consecutive use of 'wildchar'.  The
-- first part specifies the behavior for the first use of 'wildchar',
-- The second part for the second use, etc.
-- These are the possible values for each part:
-- ""        Complete only the first match.
-- "full"        Complete the next full match.  After the last match,
--         the original string is used and then the first match
--         again.
-- "longest"    Complete till longest common string.  If this doesn't
--         result in a longer string, use the next part.
-- "longest:full"    Like "longest", but also start 'wildmenu' if it is
--         enabled.
-- "list"        When more than one match, list all matches.
-- "list:full"    When more than one match, list all matches and
--         complete first match.
-- "list:longest"    When more than one match, list all matches and
--         complete till longest common string.
-- When there is only a single match, it is fully completed in all cases.
opt.wildmode = "longest,full" -- Command-line completion mode | Default "longest:full,full"

-- When 'wildmenu' is on, command-line completion operates in an enhanced
-- mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
-- the possible matches are shown just above the command line, with the
-- first match highlighted (overwriting the status line, if there is
-- one).  Keys that show the previous/next match, such as <Tab> or
-- CTRL-P/CTRL-N, cause the highlight to move to the appropriate match.
-- When 'wildmode' is used, "wildmenu" mode is used where "full" is
-- specified.  "longest" and "list" do not start "wildmenu" mode.
opt.wildmenu = true

-- opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- Disable line wrap

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
