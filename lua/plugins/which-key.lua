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
        { "<leader>wm", hidden = true },
        { "<leader>y", group = "copy" },
      },
    },
  },
}
