-- https://github.com/folke/which-key.nvim
local whichKey = require('which-key')

whichKey.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on ' in NORMAL or <C-r> in INSERT mode
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
  operators = { gc = 'Comments' },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ['<space>'] = 'SPC',
    -- ['<cr>'] = 'RET',
    -- ['<tab>'] = 'TAB',
  },
  icons = {
    breadcrumb = 'È', -- symbol used in the command line area that shows your active key combo
    separator = '?', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'none', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ '}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {'<leader>'} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

local defaultOptions = {
  mode = 'n', -- NORMAL mode
  prefix = '',  -- No prefix
  buffer = nil, -- Global mappings. Specify a buffer Gumber for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

whichKey.register({
  name = 'Insert Mode',

  -- Pops out to insert mode and inserts line above.
  ['<C-j>'] = { '<C-o>O', 'Insert Line, Move Above' },
  ['<C-k>'] = { '<cmd> lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },

  -- To move left and right
  ['<C-l>'] = { '<C-o>l', 'Move to the right in insert mode.' },
  ['<C-h>'] = { '<C-o>h', 'Move to the left in insert mode.' },

  ['<C-f>'] = { 'copilot#Accept("<CR>")', 'Autocomplete from copilot' },
}, { mode = 'i' })

whichKey.register({
  name = 'Normal Mode',
  ['<space>'] = { '<cmd>nohlsearch<CR>', 'Remove Regex Highlighting' },

  ['<C-]>'] = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' },

  ['<C-t>'] = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Goto Definition', },
  ['<C-_>'] = { '<cmd>Telescope lsp_references<cr>', 'Goto References' },

  -- N for NerdTree and now I don't want to unlearn this mapping.
  ['<C-n>'] = { '<cmd>NERDTreeToggle<CR>', 'Toggle File Explorer' },

  -- Telescope Searching
  ['<C-c>'] = { '<cmd>Telescope buffers<CR>', 'Fuzzy Buffer Search' },
  -- Having K be my 'grep whole project' stuff
  ['<C-q>'] = { '<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Grep in Project' },
  -- Migrated from the Ctrl-P plugin, so I'm keeping this.
  ['<C-p>'] = { '<cmd>Telescope find_files<CR>', 'Fuzzy File Search' },
  -- 'Search' the current file
  ['<C-s>'] = { '<cmd>Telescope live_grep<CR>', 'Grep in Project' },

  -- K used to open help on the <cword> which drove me mad. So searching
  -- the current word is much more useful for me.
  K = { '<cmd>Telescope grep_string<CR>', 'Grep String Under Cursor' },

  ['<C-\\>'] = { ':b#<CR>', 'Last buffer' },
  ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous By Definition' },
  [']d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next By Definition' },

  -- Window Navigation
  ['<C-j>'] = { '<C-W>j', 'Navigate Window Down' },
  ['<C-k>'] = { '<C-W>k', 'Navigate Window Up' },
  ['<C-h>'] = { '<C-W>h', 'Navigate Window Left' },
  ['<C-l>'] = { '<C-W>l', 'Navigate Window Right' },
})

whichKey.register({
  a = { '<cmd>A<CR>', 'Flip to alternate (spec) file' },

  c = {
    -- Uses the currently open file, and sets the current window's pwd to it's directory.
    d = { '<cmd>lcd %:~:h<cr>:pwd<CR>', 'Set Window PWD to Current Buffer' },
  },

  -- Not a group, but I'm super used to this mapping.
  f = { '<cmd>NERDTreeFind<CR>', 'Current File in Explorer' },

  -- g = { '<cmd>G<CR>', 'Open Git Fugitive' },

  l = {
    name = 'LSP',
    c = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code actions', },

    d = {
      -- Diagnostic Open
      o = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open Diagnostic', },

      -- Diagnostic Location List
      l = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Set Diagnostic Location List', },
    },

    e = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration', },
    -- "Follow" References
    f = { '<cmd>Telescope lsp_references<cr>', 'Goto References' },
    -- "Goto" definition
    g = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Goto Definition', },
    h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation', },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename identifier' },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type Definition' },

    s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
    wa = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace Folder', },
    wl = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folders', },
    wr = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder', },

  -- Optional
  -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  --
  -- I prefer Telescope lsp_references
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --
  -- Should happen on save
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  },

  m = {
    name = 'Monstrous/Misc Commands',
    b = {"<cmd>exec 'source' . fnamemodify($MYVIMRC, ':h') . '/plugin/bufferline.lua'<CR>", 'Load bufferline'},

    -- I've had vim set a file as unmodifiable and it just needs reopened.
    -- I have no idea why, but this technique will make it modifiable again.
    m  = { '<cmd>set ma<cr>:set filetype?<cr>', 'Make Buffer Modifiable' },
    -- Does what it says, the commands are write-only code.
    e = { 'mmHmt:%s/<C-V><cr>//ge<cr>"tzt"m', 'Remove Windows Line-Ending' },
  },

  o = {
    name = 'Open Important Files',
    -- botright opens a vertical split in on the right, or bottom
    -- vsplit open vertical split.
    n = { ':botright vsplit ~/.npmrc<CR>', 'Open .npmrc' },
    v = { ':botright vsplit ~/.config/nvim/init.vim<CR>', 'Open init.vim' },
    ['<leader>v'] = { ':source ~/.config/nvim/init.vim<CR>', 'Source init.vim' },
    z = { ':botright vsplit ~/.zshrc<CR>', 'Open .zshrc' },
  },

  p = {
    name = 'Previews',
    -- Pop open a pretty glow preview, good for markdown
    m = { '<cmd>Glow<CR>', 'Open Glow Markdown Preview' },
  },

  q = { '<cmd>qa<CR>', 'Quit vim' },

  -- Reload the file from disk. Handy when you changed things outside of vim.
  -- Also sets the buffer as modifiable, in case that bugged out.
  -- Think of it as "<leader> refresh"
  r = { '<cmd>set ma<CR><cmd>e!<CR>', 'Refresh Buffer from Disk' },

  s = {
    name = 'Search / Session',

    -- Search Commands
    a = { '<cmd>Telescope<CR>', 'All Telescope Options' },
    b = { '<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Fuzzy find in current buffer' },
    c = { '<cmd>Telescope buffers<CR>', 'Fuzzy Buffer Search' },
    f = { '<cmd>Telescope find_files<CR>', 'Fuzzy File Search' },
    e = { '<cmd>lua require("telescope.builtin").live_grep({grep_open_files=true})', 'Grep open buffers' },
    g = { '<cmd>Telescope live_grep<CR>', 'Grep in Project' },
    h = { '<cmd>Telescope help_tags<CR>', 'Fuzzy Help Tag Search' },
    p = { '<cmd>Telescope projects<CR>', 'Go To Recent Repo' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Recently opened files' },
    t = { '<cmd>Telescope treesitter<CR>', 'Find language tokens' },

    -- Session Commands
    -- TODO: Convert the following vim commands into lua, requiring getting the sessions_dir
    -- Create a mapping of 'ss' for session save that will call the Obsession
    -- command from vim-obsession to overwrite and watch our session, updating it
    -- when we make layout changes or quit.
    -- exec 'nnoremap <Leader>ss :Obsession ' . g:sessions_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'

    -- Open an existing session, showing us the available sessions.
    -- exec 'nnoremap <Leader>so :so ' . g:sessions_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'

    -- Pause tracking of the current session. Rerun to start tracking again.
    -- exec 'nnoremap <Leader>sp :Obsession<CR>'
  },

  t = {
    name = 'Terminal',
    -- n = { '<cmd>lua _NODE_TOGGLE()<cr>', 'Node' },
    -- u = { '<cmd>lua _NCDU_TOGGLE()<cr>', 'NCDU' },
    -- t = { '<cmd>lua _HTOP_TOGGLE()<cr>', 'Htop' },
    -- p = { '<cmd>lua _PYTHON_TOGGLE()<cr>', 'Python' },
    t = { '<cmd>term<cr>i', 'Pane' },
    f = { '<cmd>ToggleTerm direction=float<cr>', 'Float' },
    h = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal' },
    v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' },
    -- v = { '<cmd>vsplit <cr>|<cmd> term<cr>i', 'Vertical' },
  },

  v = {
    name = 'VSCode Tasks',
    t = { ':lua require("telescope").extensions.vstask.tasks()<CR>', 'Tasks' },
    i = { ':lua require("telescope").extensions.vstask.inputs()<CR>', 'Inputs'  },
    c = { ':lua require("telescope").extensions.vstask.close()<CR>', 'Close' },
  },

  -- Faster ways to save.
  w = { '<cmd>update<CR>', "Save the file you're in" },
  ['<leader>w'] = { '<cmd>wa<CR>', 'Save all files.' },

  y = {
    name = 'Toggle options',
    s = { '<cmd>setlocal spell!<CR>', 'Toggle Spell Check' },
  },
}, { prefix = '<leader>', })

whichKey.register({
  t = {
    n = { '<cmd>tabnew<CR>', "Create new tab" },
    c = { '<cmd>tabclose<CR>', "Close tab" },
  },

  s = { '<cmd>source %<CR>', 'Source current file' },
}, { prefix = '<leader><leader>', });
