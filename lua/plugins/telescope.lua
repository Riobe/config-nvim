local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",

  keys = {
    { "<C-p>", LazyVim.pick("auto"), desc = "Find Files (Root Dir)" },
    { "<C-s>", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<C-c>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    -- I'm switching to treesitter symbols, so I'm unmapping the default
    { "<leader>ss", false },
    -- I want this one to search the current directory
    { "<leader>sG", false },
    -- I want this one to pull up the current file in NERDTree
    { "<leader>ff", false },
    -- This uses neotree and I want to use NERDTree
    { "<leader>ft", false },
    -- { "<leader>e", false },
    -- { "<leader>E", false },
  },

  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        i = {
          ["<c-k>"] = actions.move_selection_previous,
          ["<c-j>"] = actions.move_selection_next,
        },
      },
    },

    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
      buffers = {
        show_all_buffers = true,
        sort_lastused = true,
        -- theme = "dropdown",
        -- previewer = true,
        mappings = {
          i = {
            ["<C-d>"] = "delete_buffer",
          },
          n = {
            ["<C-d>"] = "delete_buffer",
          },
        },
      },
    },
  },
}
