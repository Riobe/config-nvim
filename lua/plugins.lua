-- Code to boostrap packer automatically on a new install if it's not there.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
end

vim.lsp.set_log_level("debug")

-- Load packer plugins on startup.
local packer = require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Collection of configurations for the built-in LSP client
  --
  -- https://github.com/neovim/nvim-lspconfig
  use 'neovim/nvim-lspconfig'

  -- WhichKey is a lua plugin for Neovim 0.5 that displays a popup
  -- with possible key bindings of the command you started typing.
  -- Heavily inspired by the original emacs-which-key and vim-which-key.
  --
  -- https://github.com/folke/which-key.nvim
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        plugins = {
          marks = true, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
          },
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
          presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
          },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
          -- override the label used to display some keys. It doesn't effect WK in any other way.
          -- For example:
          -- ["<space>"] = "SPC",
          -- ["<cr>"] = "RET",
          -- ["<tab>"] = "TAB",
        },
        icons = {
          breadcrumb = "È", -- symbol used in the command line area that shows your active key combo
          separator = "?", -- symbol used between a key and it's label
          group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
          scroll_down = '<c-d>', -- binding to scroll down inside the popup
          scroll_up = '<c-u>', -- binding to scroll up inside the popup
        },
        window = {
          border = "none", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for key maps that start with a native binding
          -- most people should not need to change this
          i = { "j", "k" },
          v = { "j", "k" },
        },
      }
    end
  }


  -- Git source for hrsh7th/nvim-cmp
  --
  -- https://github.com/petertriho/cmp-git
  use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})

  -- A completion engine plugin for neovim written in Lua. Completion
  -- sources are installed from external repositories and "sourced".
  --
  -- https://github.com/hrsh7th/nvim-cmp
  use {
      'hrsh7th/nvim-cmp',
      requires = {
          -- Snippet Engine for Neovim written in Lua
          --
          -- https://github.com/L3MON4D3/LuaSnip
          'L3MON4D3/LuaSnip',
          -- nvim-cmp source for neovim's built-in language server client.
          --
          -- https://github.com/hrsh7th/cmp-nvim-lsp
          'hrsh7th/cmp-nvim-lsp',
          -- nvim-cmp source for buffer words.
          --
          -- https://github.com/hrsh7th/cmp-buffer
          'hrsh7th/cmp-buffer',
          -- nvim-cmp source for filesystem paths.
          --
          -- https://github.com/hrsh7th/cmp-path
          'hrsh7th/cmp-path', 
          -- nvim-cmp source for vim's cmdline.
          --
          -- https://github.com/hrsh7th/cmp-cmdline
          'hrsh7th/cmp-cmdline',
          -- nvim-cmp source for neovim Lua API.
          --
          -- https://github.com/hrsh7th/nvim-cmp
          'hrsh7th/cmp-nvim-lua'
      }
  }

  -- A glow preview directly in your neovim buffer.
  --
  -- Glow description: Render markdown on the CLI, with pizzazz!
  -- Glow is a terminal based markdown reader designed from the ground
  -- up to bring out the beauty¿and power¿of the CLI.
  --
  -- Use it to discover markdown files, read documentation directly on
  -- the command line and stash markdown files to your own private collection
  -- so you can read them anywhere. Glow will find local markdown files in
  -- subdirectories or a local Git repository.
  --
  -- By the way, all data stashed is encrypted end-to-end: only you can decrypt
  -- it.
  --
  -- https://github.com/ellisonleao/glow.nvim
  use {"ellisonleao/glow.nvim", branch = 'main'}

  -- The goal of nvim-treesitter is both to provide a simple and easy way
  -- to use the interface for tree-sitter in Neovim and to provide some
  -- basic functionality such as highlighting based on it
  --
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  -- Built on the latest awesome features from neovim core. Telescope
  -- is centered around modularity, allowing for easy customization.
  --
  -- Community driven builtin pickers, sorters and previewers.
  --
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- A better user experience for interacting with and manipulating Vim marks.
  --
  -- https://github.com/chentau/marks.nvim
  use 'chentau/marks.nvim'

  -- A File Explorer For Neovim Written In Lua
  --
  -- https://github.com/kyazdani42/nvim-tree.lua
  -- use {
      -- 'kyazdani42/nvim-tree.lua',
      -- requires = {
        -- -- A lua fork of vim-devicons. This plugin provides the same icons as well as
        -- -- colors for each icon.
        -- --
        -- -- https://github.com/kyazdani42/nvim-web-devicons
        -- 'kyazdani42/nvim-web-devicons', -- optional, for file icon
      -- }
  -- }

  -- A lua fork of vim-devicons. This plugin provides the same icons as well
  -- as colors for each icon.
  --
  -- https://github.com/kyazdani42/nvim-web-devicons
  use 'kyazdani42/nvim-web-devicons'

  -- The fully customizable greeter for Neovim
  -- NOTE: Just for fun, I liked the hydra on startup.
  --
  -- https://github.com/startup-nvim/startup.nvim
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  }

  -- A neovim plugin to persist and toggle multiple terminals during an editing session
  --
  -- https://github.com/akinsho/toggleterm.nvim
  use {"akinsho/toggleterm.nvim"}

  -- Disables relative line numbers when they don't make sense,
  -- e.g. when entering insert mode.
  --
  -- https://github.com/nkakouros-original/numbers.nvim
  use "nkakouros-original/numbers.nvim"
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return packer
