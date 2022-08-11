-- Use an on_attach function to set options after the language server
-- attaches to the current buffer
local on_attach = function(_, bufnr)
 -- Enable completion triggered by <c-x><c-o>
 vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Python     -> Pyright
-- Typescript -> tsserver
-- YAML -> yamlls
local servers = { "pyright", "tsserver", "yamlls" }
for _, lsp in pairs(servers) do
 require("lspconfig")[lsp].setup({
  on_attach = on_attach,
  flags = {
   debounce_text_changes = 150,
  },
 })
end

require("lspconfig").sumneko_lua.setup({
 settings = {
  Lua = {
   completion = {
    callSnippet = "Replace",
   },
   diagnostics = {
    enable = true,
    globals = { "vim", "use" },
   },
   workspace = {
    library = vim.api.nvim_get_runtime_file("", true),
    maxPreload = 10000,
    preloadFileSize = 10000,
   },
   telemetry = { enable = false },
  },
  on_attach = on_attach,
  flags = {
   debounce_text_changes = 150,
  },
 },
})
