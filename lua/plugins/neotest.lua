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
        require("neotest-python")({
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          -- Command line arguments for runner
          -- Can also be a function to return dynamic values
          -- args = { "--log-level", "DEBUG" },
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          -- runner = "pytest",
          runner = "unittest",
          -- Custom python path for the runner.
          -- Can be a string or a list of strings.
          -- Can also be a function to return dynamic value.
          -- If not provided, the path will be inferred by checking for
          -- virtual envs in the local directory and for Pipenev/Poetry configs
          python = ".venv/bin/python",
          -- Returns if a given file path is a test file.
          -- NB: This function is called a lot so don't perform any heavy tasks within it.
          -- is_test_file = function(file_path)
          --   ...
          -- end,
          -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
          -- instances for files containing a parametrize mark (default: false)
          pytest_discover_instances = true,
        }),
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
