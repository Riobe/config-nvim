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
  use { 'folke/which-key.nvim' }

  -- Git source for hrsh7th/nvim-cmp
  --
  -- https://github.com/petertriho/cmp-git
  use({'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim'})

  -- A completion engine plugin for neovim written in Lua. Completion
  -- sources are installed from external repositories and "sourced".
  --
  -- https://github.com/hrsh7th/nvim-cmp
  use {
      'hrsh7th/nvim-cmp',
      requires = {
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
          'hrsh7th/cmp-nvim-lua',

          -- luasnip completion source for nvim-cmp
          --
          -- https://github.com/saadparwaiz1/cmp_luasnip
          'saadparwaiz1/cmp_luasnip',
      }
  }

  -- Snippet Engine for Neovim written in Lua
  --
  -- https://github.com/L3MON4D3/LuaSnip
  use {
      'L3MON4D3/LuaSnip',
      after = 'nvim-cmp',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end
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
  use {'ellisonleao/glow.nvim', branch = 'main'}

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
  use 'chentoast/marks.nvim'

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
    'startup-nvim/startup.nvim',
    requires = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
  }

  -- A neovim plugin to persist and toggle multiple terminals during an editing session
  --
  -- https://github.com/akinsho/toggleterm.nvim
  use {'akinsho/toggleterm.nvim'}

  -- Disables relative line numbers when they don't make sense,
  -- e.g. when entering insert mode.
  --
  -- https://github.com/nkakouros-original/numbers.nvim
  use 'nkakouros-original/numbers.nvim'

  -- Smart and Powerful commenting plugin for Neovim
  --
  -- https://github.com/numToStr/Comment.nvim
  use 'numToStr/Comment.nvim'

  -- An always-on highlight for a unique character in every word on a
  -- line to help you use f, F and family.
  --
  -- https://github.com/unblevable/quick-scope
  use 'unblevable/quick-scope'

  -- Written by Ethan Write, my co-worker from Yonomi/Allegion. :)
  -- Handles letting you quickly run commands from a .vscode/tasks.json
  --
  -- https://github.com/EthanJWright/vs-tasks.nvim
  use {
    'EthanJWright/vs-tasks.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }

  -- project.nvim is an all in one neovim plugin written in lua that provides superior project management.
  -- (If it does say so itself)
  -- Automagically cd to project directory using nvim lsp
  --   Dependency free, does not rely on lspconfig
  -- If no lsp then uses pattern matching to cd to root directory
  -- Telescope integration :Telescope projects
  --   Access your recently opened projects from telescope!
  --   Asynchronous file io so it will not slow down vim when reading the history file on startup.
  --
  -- https://github.com/ahmedkhalf/project.nvim
  use 'ahmedkhalf/project.nvim'

  -- Like vscode?
  use 'tomasiser/vim-code-dark'

  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  --
  -- Motivation
  -- Neovim's LSP ecosystem is growing, and plugins like telescope.nvim and trouble.nvim make it a joy to work with LSP features like code actions and diagnostics.
  --
  -- Unlike the VS Code and coc.nvim ecosystems, Neovim doesn't provide a way for non-LSP sources to hook into its LSP client. null-ls is an attempt to bridge that gap and simplify the process of creating, sharing, and setting up LSP sources using pure Lua.
  --
  -- null-ls is also an attempt to reduce the boilerplate required to set up general-purpose language servers and improve performance by removing the need for external processes.
  --
  --https://github.com/jose-elias-alvarez/null-ls.nvim
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Friendly Snippets
  -- Snippets collection for a set of different programming languages for faster development.
  --
  -- The only goal is to have one community driven repository for all kinds of snippets in all programming languages, this way you can have it all in one place.
  --
  -- https://github.com/rafamadriz/friendly-snippets
  use 'rafamadriz/friendly-snippets'

  -- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.
  --
  -- https://github.com/TimUntersberger/neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  --
  -- https://github.com/folke/trouble.nvim
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", }

  -- It sets vim.ui.select to telescope. That means for example that neovim core stuff can fill the telescope picker. Example would be lua vim.lsp.buf.code_action().
  --
  -- https://github.com/nvim-telescope/telescope-ui-select.nvim
  use {'nvim-telescope/telescope-ui-select.nvim' }

  -- Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
  --
  -- https://github.com/tpope/vim-surround
  use {'tpope/vim-surround'}

  -- If you've ever tried using the . command after a plugin map, you were likely disappointed to discover it only repeated the last native command inside that map,
  -- rather than the map as a whole. That disappointment ends today. Repeat.vim remaps . in a way that plugins can tap into it.
  --
  -- https://github.com/tpope/vim-repeat
  use {'tpope/vim-repeat' }

  -- Quickly get to back/next or toggling on pairs of commands.
  use {'tpope/vim-unimpaired'}

  -- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
  --
  -- https://github.com/akinsho/bufferline.nvim
  -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- A Neovim bufferline for people with addictive personalities
  -- The goal of this plugin is not to be an opinionated bufferline with (more or less) limited customization options. Rather,
  -- it tries to provide a general framework allowing you to build your ideal bufferline, whatever that might look like.
  --
  -- https://github.com/noib3/nvim-cokeline
  use({
    'noib3/nvim-cokeline',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }, -- If you want devicons
  })
  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  --
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if packer_bootstrap then
      require('packer').sync()
  end
end)

return packer
