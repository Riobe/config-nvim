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
unmap({ "n", "v" }, "<C-a>")
unmap({ "n", "v" }, "<C-x>")
map("i", "<C-l>", "<C-o>l", { desc = "Move to the right in insert mode." })
map("i", "<C-h>", "<C-o>h", { desc = "Move to the left in insert mode." })
map("i", "<C-j>", "<C-o>O", { desc = "Move to a new line above the current" })
vim.keymap.set("n", "[ ", '@="m`O<C-V><Esc>``"<CR>')
vim.keymap.set("n", "] ", '@="m`o<C-V><Esc>``"<CR>')

-- # Buffers
map("n", "<C-\\>", "<cmd>b #<cr>", { desc = "Last Buffer" })
map("n", "]b", function()
  return "<cmd>" .. vim.v.count1 .. "bnext<CR>"
end, { desc = "Next Buffer", expr = true })
map("n", "[b", function()
  return "<cmd>" .. vim.v.count1 .. "bprev<CR>"
end, { desc = "Next Buffer", expr = true })
-- I handle this with <C-\>
unmap("n", "<leader>`") -- Default: "<cmd>b #<cr>"
-- I handle this with <C-c>
unmap("n", "<leader>,") -- Default: "<cmd>Telescope buffers<cr>"

-- # Saving
map("n", "<leader>w", "<cmd>update<cr>", { desc = "Write File" })
map("n", "<leader><leader>w", "<cmd>wa<cr><esc>", { desc = "Save All Files" })
-- Unmapping this way of saving in favor of leader w, overwritten with grep
-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- # Windows
unmap("n", "<leader>-") -- Default: <C-w>s
unmap("n", "<leader>|") -- Default: <C-w>v
LazyVim.ui.maximize():map("<C-w>m")
map("t", "<C-H>", "<C-\\><C-N><C-w>h", { desc = "Move to the left in terminal mode." })
map("t", "<C-J>", "<C-\\><C-N><C-w>j", { desc = "Move down in terminal mode." })
map("t", "<C-K>", "<C-\\><C-N><C-w>k", { desc = "Move up in terminal mode." })
map("t", "<C-L>", "<C-\\><C-N><C-w>l", { desc = "Move to the right in terminal mode." })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>rr",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>e!<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update / Refresh" }
)
map("n", "<leader>;", "<cmd>Telescope commands<CR>", { desc = "Commands" })

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
-- Handled this one in my telescope config
unmap("n", "<leader>/") -- Default: LazyVim.pick("live_grep")
unmap("n", "<leader>e") -- Default: 󰙅 Explorer NeoTree (Root Dir)
unmap("n", "<leader>E") -- Default: 󰙅 Explorer NeoTree (cwd)

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

-- # Code
map("n", "<leader>cm", function()
  vim.cmd("silent make")
  local quickFixCount = #vim.fn.getqflist()
  if quickFixCount > 0 then
    vim.cmd("copen")
  else
    vim.notify("No errors found", vim.log.levels.INFO, { title = "Build" })
  end
end, { desc = "Build Typescript and see errors" })

map("n", "<leader>cq", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end

  if qf_exists == true then
    vim.cmd("cclose")
    return
  else
    vim.cmd("copen")
  end

  -- NOTE: If you want to only open if there are items, switch to this
  -- if not vim.tbl_isempty(vim.fn.getqflist()) then
  --   vim.cmd("copen")
  -- end
end, { desc = "Toggle quickfix" })

-- # Git
map("n", "<leader>gdd", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diff Current with Main" })
map("n", "<leader>gdm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", { desc = "Diff with Main" })
map("n", "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", { desc = "File History" })
map("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Close Diff" })

-- # Terminal
map("n", "<leader>T", "<cmd>terminal<cr>i", { desc = "Terminal" })
map("t", "<C-[><C-[>", "<C-\\><C-n>", { desc = "Escape terminal to nvim" })
map("t", "<C-[><C-]>", "<Esc>", { desc = "Send escape to terminal" })

-- # VS Tasks
map("n", "<leader>vt", "<cmd>lua require('telescope').extensions.vstask.tasks()<CR>", { desc = "Tasks" })
map("n", "<leader>vi", "<cmd>lua require('telescope').extensions.vstask.inputs()<CR>", { desc = "Task Inputs" })
map("n", "<leader>vc", "<cmd>lua require('telescope').extensions.vstask.close()<CR>", { desc = "Close Tasks" })
map("n", "<leader>vj", "<cmd>lua require('telescope').extensions.vstask.jobs()<CR>", { desc = "Jobs" })
map("n", "<leader>vh", "<cmd>lua require('telescope').extensions.vstask.jobhistory()<CR>", { desc = "Job History" })
map("n", "<leader>vp", "<cmd>lua require('telescope').extensions.vstask.history()<CR>", { desc = "History" })
map("n", "<leader>vl", "<cmd>lua require('telescope').extensions.vstask.launch()<CR>", { desc = "Launch" })

-- # Open
map("n", "<leader>fB", ":e ~/.bashrc<CR>", { desc = "Open .bashrc" })
map("n", "<leader>A", "<cmd>A<cr>", { desc = "Flip to alternate (spec) file" })

-- # Copy
map("n", "<leader>yf", "<cmd>call setreg('+' , expand('%'))<CR>", { desc = "Copy Filename to Clipboard" })
