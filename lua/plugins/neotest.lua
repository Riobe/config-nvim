return {
  -- TODO: Fix the icons this shows from ?'s to something pretty
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-jest" },
  { "nvim-neotest/neotest-python" },
  {
    "nvim-neotest/neotest",

    opts = {
      adapters = {
        "neotest-plenary",
        ["neotest-jest"] = {
          jestConfigFile = function(file)
            if vim.fn.filereadable(vim.fn.getcwd() .. "/jest-qa.config.js") == 1 then
              return vim.fn.getcwd() .. "/jest-qa.config.js"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
        },
        "neotest-python",
      },

      icons = {
        -- expanded = "▶",
        -- child_prefix = "⧋",
        -- child_indent = "▸",
        -- final_child_prefix = "▹",
        -- non_collapsible = "◬",
        -- collapsed = "◂",
        -- unknown = "?",

        passed = "✓",
        running = "⋯",
        failed = "✗",
        skipped = "?",
        watching = "☉",
      },
    },
  },
}
