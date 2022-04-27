-- https://github.com/folke/which-key.nvim
local whichKey = require('which-key')

local defaultOptions = {
  mode = "n", -- NORMAL mode
  prefix = "",  -- No prefix
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

whichKey.register({
    name = "Insert mode",
    -- Pops out to insert mode and inserts line above.
    ["<C-j>"] = { "<C-o>O", "Insert Line, Move Above" }
}, { mode = "i" })

whichKey.register({
    name = "Searching",
    ["<space>"] = { "<cmd>nohlsearch<CR>", "Clear Highlight" },
    ["<C-p>"]   = { "<cmd>Telescope find_files<CR>", "Fuzzy File Search" },
    -- C-s on terminals can be used for flow control, you may need to try to
    -- get your terminal to stop intercepting it. Use the following link to help:
    --
    -- https://superuser.com/questions/588846/cannot-get-vim-to-remap-ctrls-to-w
    ["<C-s>"]   = { "<cmd>Telescope live_grep<CR>", "Grep in Project" },
    ["K"] =  { "<cmd>Telescope grep_string<CR>", "Grep String Under Cursor" },
    ["<C-t>"] = { "<cmd>Telescope treesitter<CR>", "Find language tokens" },
    ["<leader>s"] = {
      name = "Telescope Searching",
      f = { "<cmd>Telescope find_files<CR>", "Fuzzy File Search" },
      s = { "<cmd>Telescope live_grep<CR>", "Grep in Project" },
      b = { "<cmd>Telescope buffers<CR>", "Fuzzy Buffer Search" },
      h = { "<cmd>Telescope help_tags<CR>", "Fuzzy Help Tag Search" },
      t = { "<cmd>Telescope<CR>", "All Telescope Options" },
    }
})

whichKey.register({
    name = "Miscellaneous",
    -- Uses the currently open file.
    cd = { "<cmd>cd %:p:h<cr>:pwd<CR>", "Move PWD Here" },
    sc = { "<cmd>setlocal spell!<CR>", "Toggle Spell Check" },
    -- I've had vim set a file as unmodifiable and it just needs reopened.
    -- I have no idea why, but this technique will make it modifiable again.
    m  = { "<cmd>set ma<cr>:set filetype?<cr>", "Make Buffer Modifiable" },
    -- Does what it says, the commands are write-only code.
    ["<leader>m"]  = { "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm", "Remove Windows Line-Ending" },
    -- Pop open a pretty glow preview
    p = { "<cmd>Glow<CR>", "Open Glow MD Preview" }
}, { prefix = "<leader>", })

whichKey.register({
    name = "File Navigation",
    ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
    ["<leader>f"] = { "<cmd>NvimTreeFindFileToggle<CR>", "Current File in Explorer" },
    -- ["<C-n>"] = { "<cmd>NERDTreeToggle<CR>", "Toggle File Explorer" },
    -- ["<leader>f"] = { "<cmd>NERDTreeFind<CR>", "Current File in Explorer" }
})

whichKey.register({
    name = "Window Navigation",
    ["<C-j>"] = { "<C-W>j", "Navigate Window Down" },
    ["<C-k>"] = { "<C-W>k", "Navigate Window Up" },
    ["<C-h>"] = { "<C-W>h", "Navigate Window Left" },
    ["<C-l>"] = { "<C-W>l", "Navigate Window Right" },
})
