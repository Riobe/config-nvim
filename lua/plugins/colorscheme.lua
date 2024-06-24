return {
  -- Configure LazyVim to load my color scheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = { "catppuccin-mocha" },
      -- colorscheme = { "evening" },
      -- use('tomasiser/vim-code-dark')
    },
  },
}
