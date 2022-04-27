require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "regex",
    "ruby",
    "rust",
    "tsx",
    "typescript",
    "vim",
    "yaml"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "php" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the
    -- filetype. (for example if you want to disable highlighting
    -- for the `tex` filetype, you need to include `latex` in this
    -- list as this is the name of the parser) list of language that
    -- will be disabled disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter
    -- at the same time. Set this to `true` if you depend on 'syntax'
    -- being enabled (like for indentation). Using this option may slow
    -- down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
