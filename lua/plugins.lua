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
  use { "folke/which-key.nvim" }

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

  -- Smart and Powerful commenting plugin for Neovim
  --
  -- https://github.com/numToStr/Comment.nvim
  use 'numToStr/Comment.nvim'
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return packer
