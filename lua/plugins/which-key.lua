return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      plugins = { spelling = true },
      defaults = {
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
        { "<leader>u", group = "ui" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "<leader>v", group = "tasks" },
        { "<leader>y", group = "copy" },
      },
    },
  },
}
