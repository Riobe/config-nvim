local util = require('vim.lsp.util')

local lsp_formatting = function(client, bufnr)
  local params = util.make_formatting_params({})
  client.request('textDocument/formatting', params, nil, bufnr);
  -- vim.lsp.buf.format({
  --     filter = function(clients)
  --         -- filter out clients that you don't want to use
  --         return vim.tbl_filter(function(client)
  --             return client.name ~= "tsserver"
  --         end, clients)
  --     end,
  --     bufnr = bufnr,
  -- })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(client, bufnr)
      end,
    })
  end
end

require('null-ls').setup({
  sources = {
    -- require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.diagnostics.eslint,
    require('null-ls').builtins.formatting.eslint_d,
    -- require('null-ls').builtins.completion.spell,
  },
  on_attach = on_attach
})
