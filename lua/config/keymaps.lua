-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

-- By default the hotkeys are:
--
-- Better up/down j and k do the same thing but now automatically do gj/gk on wrapped lines
-- Moving windows with <ctrl> hjkl happens automatically.
-- Resize windows with <ctrl> arrow keys
-- Move buffers with shift h/l
-- Actions related to quitting or getting back your last session start with <leader>q
-- Make it so that undo-ing goes back to the last `,`, `.`, and `;`.

-- # Editing
unmap({ "n", "v" }, "s")
unmap({ "n", "v" }, "S")
map("i", "<C-l>", "<C-o>l", { desc = "Move to the right in insert mode." })
map("i", "<C-h>", "<C-o>h", { desc = "Move to the left in insert mode." })
map("i", "<C-j>", "<C-o>O", { desc = "Move to a new line above the current" })

-- # Buffers
map("n", "<C-\\>", "<cmd>b #<cr>", { desc = "Last Buffer" })
-- TODO: This would be nice to get working, but unmaps unimpaired too
-- Unmap the default buffer switch mappings, to let vim-unimpaired take over
-- unmap("n", "[b") -- Default: "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" }
-- unmap("n", "]b") -- Default: "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" }

-- # Saving
map("n", "<leader>w", "<cmd>update<cr>", { desc = "Save File" })
map("n", "<leader><leader>w", "<cmd>wa<cr><esc>", { desc = "Save All Files" })
-- Unmapping this way of saving in favor of leader w, overwritten with grep
-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- # Windows
map("n", "<C-w>m", function()
  LazyVim.toggle.maximize()
end, { desc = "Maximize Toggle" })
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")
unmap("n", "<leader>-")
unmap("n", "<leader>|")
unmap("n", "<leader>wm")

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>rr",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>e!<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update / Refresh" }
)

-- # Search
map("n", " ", "<Cmd>nohlsearch<CR>", { desc = "Clear highlight" })
map("n", "<leader>sA", "<Cmd>Telescope<CR>", { desc = "All Telescope" })
map("n", "<leader>ss", "<Cmd>Telescope treesitter<CR>", { desc = "Symbols (Treesitter)" })
map(
  "n",
  "<leader>sG",
  "<cmd>lua require('telescope.builtin').live_grep({ cwd = require('telescope.utils').buffer_dir() })<cr>",
  { desc = "Grep (Current Directory)" }
)
map(
  "n",
  "<leader>sB",
  "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>",
  { desc = "Grep open buffers" }
)

-- Unmap the default search with space
unmap("n", "<leader> ")
-- Add a single keypress method to get to the fuzzy file finder, and buffer fuzzy find
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Search files" })
map("n", "<C-q>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy Buffer Find" })

-- Move the file explorer to where I'm used to, and unmap the default
unmap("n", "<leader>fe")
map("n", "<leader>fe", "<cmd>NERDTreeToggle<cr>", { desc = "Exploreer NERDTree" })
map("n", "<C-n>", "<cmd>NERDTreeToggle<cr>", { desc = "Explorer NERDTree" })
map("n", "<leader>ff", "<cmd>NERDTreeFind<cr>", { desc = "File (Current) in NERDTree" })
map("n", "<leader>k", "<cmd>Telescope grep_string<CR>", { desc = "Grep String Under Cursor" })

-- # Keywordprg
unmap("n", "<leader>K") -- Default: "<cmd>norm! K<cr>", { desc = "Keywordprg" }

-- # Cursor
unmap("n", "H") -- Default: "<cmd>BufferLineCyclePrev<cr>", { desc = "Move to the left" }
unmap("n", "L") -- Default: "<cmd>BufferLineCycleNext<cr>", { desc = "Move to the right" }

-- # Commenting
unmap("n", "gco") -- Default: "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" }
unmap("n", "gcO") -- Default: "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" }

-- # LSP
map(
  "n",
  "<C-m>",
  "<cmd>lua require('telescope.builtin').lsp_references({ file_ignore_patterns = { '%.spec.ts' } })<cr>",
  { desc = "Goto Non-Test References" }
)
map("n", "<C-t>", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition" })
map("n", "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Type Definition" })

-- # Git
map("n", "<leader>gdd", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diff Current with Main" })
map("n", "<leader>gdm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", { desc = "Diff with Main" })
map("n", "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", { desc = "File History" })
map("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Close Diff" })

-- # Terminal
map("n", "<leader>T", "<cmd>terminal<cr>i", { desc = "Terminal" })

-- # VS Tasks
map("n", "<leader>vt", "<cmd>lua require('telescope').extensions.vstask.tasks()<CR>", { desc = "Tasks" })
map("n", "<leader>vi", "<cmd>lua require('telescope').extensions.vstask.inputs()<CR>", { desc = "Tasks" })
map("n", "<leader>vc", "<cmd>lua require('telescope').extensions.vstask.close()<CR>", { desc = "Tasks" })

-- # Open
map("n", "<leader>fB", ":e ~/.bashrc<CR>", { desc = "Open .bashrc" })
map("n", "<leader>A", "<cmd>A<cr>", { desc = "Flip to alternate (spec) file" })

-- # Copy
map("n", "<leader>yf", "<cmd>call setreg('+' , expand('%'))<CR>", { desc = "Copy Filename to Clipboard" })
