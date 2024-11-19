return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      plugins = { spelling = true },
      {
        mode = { "n", "v" },
        { "<leader><leader>", group = "additional" },
        { "<leader>v", group = "tasks" },
        { "<leader>w", desc = "write" },
        -- I want window functions on <C-w> and <leader>w for saving
        { "<leader>wm", hidden = true }, -- Disable leader window maximize
        { "<leader>wd", hidden = true }, -- Disable leader window delete
        { "<leader>y", group = "copy" },
      },
    },
  },
}
