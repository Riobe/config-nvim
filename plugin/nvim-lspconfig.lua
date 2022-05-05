-- Use an on_attach function to set options after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.cmd('echomsg "lspconfig on_attach"')
end

-- Python     -> Pyright
-- Typescript -> tsserver
-- YAML -> yamlls
local servers = { 'pyright', 'tsserver', 'yamlls' }
for _, lsp in pairs(servers) do
  vim.cmd('echomsg "Setting up server for server: ' .. lsp .. '"')
  require('lspconfig')[lsp].setup{
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
