return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  opts = {
    document_highlight = {
      enabled = false, -- Disable document highlights
    },
  },
}
