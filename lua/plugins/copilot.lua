return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-F>",
        accept_word = false,
        accept_line = false,
        next = "<C-D>",
        prev = "<C-U>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      markdown = true,
      help = true,
      typescript = true,
    },
  },
}
