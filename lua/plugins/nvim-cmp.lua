return {
  "hrsh7th/nvim-cmp",

  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.sources = vim.tbl_extend("force", opts.sources, {
      { name = "luasnip" },
    })

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<CR>"] = cmp.config.disable,
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-f>"] = cmp.mapping.confirm({ select = true }),
    })
  end,
}
