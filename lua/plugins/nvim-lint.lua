return {
  {
    "mfussenegger/nvim-lint",

    opts = {
      linters = {
        -- This does nothing
        -- markdown = {
        --   args = { "--config", "~/.markdownlint-cli2.yaml", "--" },
        -- },

        -- This does nothing
        -- markdownlint = {
        --   args = { "--config", "~/.markdownlint-cli2.yaml", "--" },
        -- },

        -- This stops _all_ linting from running on markdown.
        ["markdownlint-cli2"] = {
          -- config = { MD013 = false },
          -- config = { "~/.markdownlint-cli2.yaml" },
          -- MD013 = false,
          args = { "--config", "~/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
