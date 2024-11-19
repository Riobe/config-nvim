return {
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

            if vim.fn.filereadable(vim.fn.getcwd() .. "/jest-unit.config.js") == 1 then
              return vim.fn.getcwd() .. "/jest-unit.config.js"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
        },
        "neotest-python",
      },

      icons = {
        passed = "✓",
        running = "⋯",
        failed = "✗",
        skipped = "?",
        watching = "☉",
      },
    },
  },
}

-- return {
--   {
--     "nvim-neotest/neotest",
--     dependencies = {
--       "haydenmeade/neotest-jest",
--       "marilari88/neotest-vitest",
--       "nvim-neotest/nvim-nio",
--     },
--     keys = {
--       {
--         "<leader>tl",
--         function()
--           require("neotest").run.run_last()
--         end,
--         desc = "Run Last Test",
--       },
--       {
--         "<leader>tL",
--         function()
--           require("neotest").run.run_last({ strategy = "dap" })
--         end,
--         desc = "Debug Last Test",
--       },
--       {
--         "<leader>tw",
--         "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
--         desc = "Run Watch",
--       },
--     },
--     opts = function(_, opts)
--       table.insert(
--         opts.adapters,
--         require("neotest-jest")({
--           jestCommand = "npm test --",
--           jestConfigFile = "custom.jest.config.ts",
--           env = { CI = true },
--           cwd = function()
--             return vim.fn.getcwd()
--           end,
--         })
--       )
--       table.insert(opts.adapters, require("neotest-vitest"))
--     end,
--   },
-- }
