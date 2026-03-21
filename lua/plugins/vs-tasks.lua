-- return {
--   "EthanJWright/vs-tasks.nvim",
--   requires = {
--     "nvim-lua/popup.nvim",
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope.nvim",
--   },
-- }

return {
  "EthanJWright/vs-tasks.nvim",
  event = "VeryLazy",
  branch = "main",
  -- branch = "refactor_terminal_api",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "ThePrimeagen/harpoon",
  },
  config = function()
    require("vstask").setup({
      telescope_keys = {
        kill_job = "<C-k>",
      },
    })
  end,
}
