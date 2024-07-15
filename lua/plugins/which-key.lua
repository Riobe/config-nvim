return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      plugins = { spelling = true },
      {
        mode = { "n", "v" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "<leader>v", group = "tasks" },
        { "<leader>w", desc = "write" },
        -- TODO: Do I need this?
        -- { "<leader>w", "<cmd>update<cr>", desc = "Write", group = nil },
        { "<leader>y", group = "copy" },
      },
    },
  },
}
