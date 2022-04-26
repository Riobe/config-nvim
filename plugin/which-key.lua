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
    ["<space>"] = { ":nohlsearch<CR>", "Clear Highlight" },
    -- Display the file in the quickfix menu. :help :cc for more
    ["<leader>o"] = { ":.cc<CR>", "Browse to Quickfix File" }
})

whichKey.register({
    name = "Miscellaneous",
    -- Uses the currently open file.
    cd = { ":cd %:p:h<cr>:pwd<CR>", "Move PWD Here" },
    sc = { ":setlocal spell!<CR>", "Toggle Spell Check" },
    -- I've had vim set a file as unmodifiable and it just needs reopened.
    -- I have no idea why, but this technique will make it modifiable again.
    m  = { ":set ma<cr>:set filetype?<cr>", "Make Buffer Modifiable" },
    -- Does what it says, the commands are write-only code.
    ["<leader>m"]  = { "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm", "Remove Windows Line-Ending" },
}, { prefix = "<leader>", })

whichKey.register({
    name = "File Navigation",
    ["<C-n>"] = { ":NERDTreeToggle<CR>", "Toggle File Explorer" },
    ["<leader>f"] = { ":NERDTreeFind<CR>", "Current File in Explorer" }
})

whichKey.register({
    name = "Window Navigation",
    ["<C-j>"] = { "<C-W>j", "Navigate Window Down" },
    ["<C-k>"] = { "<C-W>k", "Navigate Window Up" },
    ["<C-h>"] = { "<C-W>h", "Navigate Window Left" },
    ["<C-l>"] = { "<C-W>l", "Navigate Window Right" },
})
